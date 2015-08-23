require 'yaml'

module YamlWebDriver
  module Spec
    class SpecParser

      def parse_from_cmdline
        sub_environment_variables(YAML.load_stream(ARGF.read))
      end

    private

      def sub_environment_variables(o)
        if o.is_a? String
          o.gsub!(/\$(\w+)/) { |match|
            if !ENV[$1].nil?
              ENV[$1]
            else
              match
            end }
        elsif o.is_a? Hash
          o.each { |_, v| sub_environment_variables(v) }
        elsif o.respond_to?(:each)
          o.each { |it| sub_environment_variables(it) }
        end
        o
      end

    end
  end
end
