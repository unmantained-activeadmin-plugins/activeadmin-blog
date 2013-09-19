module Activeadmin
  module Blog
    class Engine < ::Rails::Engine
      isolate_namespace Activeadmin::Blog
      engine_name 'activeadmin_blog'

      initializer "load admin" do
        puts File.expand_path('../../../app/admin', File.dirname(__FILE__))
        ActiveAdmin.application.load_paths += [ File.expand_path('../../../app/admin', File.dirname(__FILE__)) ]
      end
    end
  end
end

