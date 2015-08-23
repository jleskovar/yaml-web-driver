module YamlWebDriver
  module Action
    class OpenAction
      attr_accessor :url

      def initialize(url)
        @url = url
      end

      def run(driver, _)
        puts "going to url #{@url}"
        driver.browser.goto @url
      end
    end
  end
end