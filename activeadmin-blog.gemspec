# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin/blog/version'

Gem::Specification.new do |spec|
  spec.name          = "activeadmin-blog"
  spec.version       = Activeadmin::Blog::VERSION
  spec.authors       = ["Stefano Verna"]
  spec.email         = ["stefano.verna@welaika.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "friendly_id"
  spec.add_dependency "activeadmin"
  spec.add_dependency "activeadmin-gallery"
  spec.add_dependency "activeadmin-wysihtml5"
  spec.add_dependency "activeadmin-extra"
end

