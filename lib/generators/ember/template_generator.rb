require 'generators/ember/generator_helpers'

module Ember
  module Generators
    class TemplateGenerator < ::Rails::Generators::NamedBase
      include Ember::Generators::GeneratorHelpers

      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a new Ember.js template"
      class_option :javascript_engine, :desc => "Engine for JavaScripts"
      class_option :templating_engine, \
        :desc => "Templating engine",
        :default => (defined? Emblem::Rails) ? 'emblem' : 'handlebars'
      class_option :ember_path, :type => :string, :aliases => "-d", :default => false, :desc => "Custom ember app path"

      def create_template_files
        file_path = File.join \
          ember_path,
          'templates',
          class_path,
          "#{file_name}.#{template_engine_extension}"
        template "template.#{template_engine_extension}", file_path
      end

      private
      def template_engine_extension
        options[:templating_engine]
      end
    end
  end
end
