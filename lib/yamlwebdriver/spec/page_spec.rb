module YamlWebDriver
  module Spec
    class PageSpec
      attr_reader :page, :frame

      def initialize(page_doc)
        @page = page_doc['page']
        @frame = (page_doc['frame'] or '')
        @link_templates = page_doc['link_templates']
      end

      def has_frame?
        not frame.empty?
      end

      def link_template(link)
        templates = @link_templates.map { |l|
          case l
            when Hash
              l[link]
            when String
              l % {:link => link}
            else
              nil
          end
        }

        templates.compact.first
      end
    end
  end
end