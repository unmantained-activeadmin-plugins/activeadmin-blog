# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin/blog/version'

Gem::Specification.new do |spec|
  spec.name          = "activeadmin-blog"
  spec.version       = Activeadmin::Blog::VERSION
  spec.authors       = ["Stefano Verna"]
  spec.email         = ["stefano.verna@welaika.com"]
  spec.description   = "ActiveAdmin Blog"
  spec.summary       = "ActiveAdmin Blog"
  spec.homepage      = "https://github.com/stefanoverna/activeadmin-blog"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "friendly_id", "~> 5.0.0"
  spec.add_dependency "activeadmin"
  spec.add_dependency "activeadmin-gallery"
  spec.add_dependency "activeadmin-wysihtml5"
  spec.add_dependency "activeadmin-extra"
end

