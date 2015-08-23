module YamlWebDriver
  module Action
    class AlertAction
      def initialize(action)
        @action = action
      end

      # @param [YamlWebDriver::WatirDriver] driver
      def run(driver, _)
        if driver.browser.alert.exists?
          driver.browser.alert.send(@action)
        else
          raise 'no alert on page'
        end
      end
    end
  end
end