require 'net/ftp'

# Downloads tarball at the given URL if a local copy does not exist, or if the
# local copy is older than at the given URL, or if the local copy is corrupt.
def download(url)
  file = File.basename(url)
  # Download tarball if the local copy is older than at the given URL or fetch
  # it for the first time.
  sh "wget -N #{url}"
  # Resume aborted download. Do nothing if the file is already fully retrieved
  # (at the cost is a round trip to server).
  sh "wget -c #{url}"

  # Always download md5 and verify the tarball. Re-download tarball if corrupt;
  # extract otherwise.
  sh "wget #{url}.md5 && md5sum -c #{file}.md5" do |matched, _|
    if !matched
      sh "rm #{file} #{file}.md5"; download(url)
    else
      sh "tar xvf #{file}"
    end
  end
end

def databases
  host, dir = 'ftp.ncbi.nlm.nih.gov', 'blast/db'
  usr, pswd = 'anonymous', ENV['email']

  Net::FTP.open(host, usr, pswd) do |con|
    con.passive = true
    con.nlst(dir).
      map { |file| File.join(host, file) }.
      select { |file| file.match(/\.tar\.gz$/) }.
      group_by { |file| File.basename(file).split('.')[0] }
  end
end

databases.each do |name, files|
  multitask(name => files.map { |file| task(file) { download(file) } })
end

task :default do
  puts databases.keys.join(', ')
end
