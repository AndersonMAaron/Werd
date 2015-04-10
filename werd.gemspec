Gem::Specification.new do |s|
  s.name        = 'werd'
  s.version     = '0.0.1'
  s.date        = '2015-04-10'
  s.summary     = 'Werd'
  s.description = 'Word parsing library & games'
  s.homepage    = 'https://www.google.com/'
  s.authors     = ['Aaron Anderson']
  s.email       = 'andersonmaaron@gmail.com'

  s.executables << Dir['bin/*']
  s.files       =  Dir['lib/**/*.rb']

  s.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.2'
  s.add_development_dependency 'simplecov', '~> 0.9', '>= 0.9.1'
end
