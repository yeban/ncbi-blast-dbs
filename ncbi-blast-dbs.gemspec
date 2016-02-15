Gem::Specification.new do |s|
  s.authors     = ['Anurag Priyam']
  s.email       = ['anurag08priyam@gmail.com']
  s.name        = 'ncbi-blast-dbs'
  s.version     = '0.0.2'
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
  s.add_dependency('rake', '~> 10.3', '>= 10.3.2')
  s.executables   = ['ncbi-blast-dbs']
end
