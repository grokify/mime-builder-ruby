lib = 'mime_builder'
lib_file = File.expand_path("../lib/#{lib}.rb", __FILE__)
File.read(lib_file) =~ /\bVERSION\s*=\s*["'](.+?)["']/
version = $1

Gem::Specification.new do |s|
  s.name        = lib
  s.version     = version
  s.date        = '2016-12-14'
  s.summary     = 'MIME Builder is a helper to build MIME parts'
  s.description = 'Helper library to build MIME parts'
  s.authors     = ['John Wang']
  s.email       = 'johncwang@gmail.com'
  s.homepage    = 'https://github.com/grokify/'
  s.licenses    = ['MIT']
  s.files       = Dir['lib/**/**/*'] + Dir['[A-Z]*'] + Dir['test/**/*']
  # s.files.reject! { |fn| fn.include? "CVS" }
  # s.required_ruby_version = '>= 1.8.7' # 1.8.7+ is tested
  s.add_dependency 'mime', '~> 0.4', '>= 0.4.3'
  s.add_dependency 'mime-types', '~> 3.1'
  s.add_dependency 'multi_json', '~> 1', '>= 1.12.1'

  s.add_development_dependency 'coveralls', '~> 0'
  s.add_development_dependency 'mocha', '~> 1'
  s.add_development_dependency 'rake', '~> 12'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'test-unit', '~> 3'
end
