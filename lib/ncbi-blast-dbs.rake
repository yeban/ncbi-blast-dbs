require 'net/ftp'

def download(url)
  file = File.basename(url)
  sh "wget -Nc #{url} && wget -Nc #{url}.md5 &&"\
     " md5sum -c #{file}.md5 && tar xvf #{file}"\
     " || rm #{file} #{file}.md5"
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
