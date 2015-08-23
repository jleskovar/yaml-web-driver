
require 'yamlwebdriver/spec/page_spec'

module YamlWebDriver
  module Spec
    class PageSpecs
      def initialize(parsed_page_docs)
        @pages = Hash[parsed_page_docs.map { |p| [p['page'], PageSpec.new(p)] }]
      end

      def has_page?(name)
        @pages.has_key? name
      end

      # @return [PageSpec]
      def named_page(name)
        @pages[name]
      end
    end
  end
end