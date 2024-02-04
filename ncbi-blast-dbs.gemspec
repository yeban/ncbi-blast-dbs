Gem::Specification.new do |s|
  s.authors     = ['Anurag Priyam']
  s.email       = ['anurag08priyam@gmail.com']
  s.name        = 'ncbi-blast-dbs'
  s.version     = '0.1.0'
  s.summary     = 'Fast download BLAST databases from NCBI.'
  s.description = <<DESC
Downloads BLAST databases from NCBI. Database files (volumes) are downloaded in
parallel; number of threads to use is determined automatically.  Database files
are verified and extracted upon download.
DESC
  s.license     = 'MIT'
  s.homepage    = 'http://github.com/yeban/ncbi-blast-dbs'

  s.files         = `git ls-files`.split
  s.require_paths = ['lib']
  s.add_dependency('rake', '~> 13.0')
  s.add_dependency('net-ftp', '~> 0.1.3')
  s.executables   = ['ncbi-blast-dbs']
end
