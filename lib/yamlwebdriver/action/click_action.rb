module YamlWebDriver
  module Action
    class ClickAction
      def initialize(page_link)
        @page_link = page_link
      end

      # @param [YamlWebDriver::WatirDriver] driver
      # @param [PageSpecs] pages
      def run(driver, pages)
        page_name, link_name = @page_link.split('.')
        puts "hitting page #{page_name}.#{link_name}"

        if pages.has_page? page_name
          page = pages.named_page(page_name)
          link_template = page.link_template(link_name)
          link = driver.find_element(link_template, frame: page.frame)
          link.click
        else
          raise "no page named #{page_name}"
        end
      end
    end
  end
end