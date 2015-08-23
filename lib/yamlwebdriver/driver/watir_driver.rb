
module YamlWebDriver
  module Driver
    class WatirDriver
      attr_accessor :options
      attr_accessor :browser

      # @param [YamlWebDriver::BootstrapOptions] options
      # @param [Watir::Browser] browser
      def initialize(options, browser)
        @options = options
        @browser = browser
      end

      # Searches for an element in the current browser context
      # @param [String] elem element to search for
      # @param [String] frame the root frame containing the element
      # @param [Symbol] selector message to send to element container. Either :frame or :element. Defaults to :element
      # @return [Watir::Element]
      def find_element(elem, frame: '', selector: :element)
        element_container = if frame.empty?; @browser else find_element(frame, selector: :frame) end

        found_elements = [:id, :name, :xpath, :css]
                             .map { |s| element_container.send(selector, s, elem) }
                             .select { |e| begin e.exists? rescue false end }

        raise "element #{elem} could not be found" if found_elements.empty?

        found_elements.first
      end

      def exit
        @browser.close unless @options.leave_open
      end

      # @return [Watir::Browser]
      def browser
        @browser
      end
    end
  end
end
