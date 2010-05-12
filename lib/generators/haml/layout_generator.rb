require 'generators/haml'
require 'rails/generators/named_base'

module Haml
  module Generators
    class LayoutGenerator < Rails::Generators::NamedBase
      extend TemplatePath
      
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'
        
      def create_layout
        template 'layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
        copy_file 'stylesheet.sass', "public/stylesheets/sass/#{file_name}.sass"
        copy_file 'layout_helper.rb', 'app/helpers/layout_helper.rb'
        copy_file 'error_messages_helper.rb', 'app/helpers/error_messages_helper.rb'
      end
      
      private
      
      def file_name
        layout_name.underscore
      end
    end
  end
end
