module YamlWebDriver
  module Runner
    class BrowserSpecRunner
      # @param [YamlWebDriver::WatirDriver] driver
      # @param [Array] actions
      # @param [PageSpecs] pages
      def initialize(driver, actions, pages)
        @driver = driver
        @actions = actions
        @pages = pages
        reset
      end

      def run
        run_to_end(@actions.each)
      end

      def run_next
        begin
          run_action(@action_enumerator.next)
        rescue StopIteration
          #nop
        end
      end

      def reset
        @action_enumerator = @actions.each
      end

      def run_to_end(action_enumerator)
        action_enumerator.each { |a| run_action(a) }
      end

      private

      def run_action(action)
        puts "running action #{action.to_s}"
        action.run(@driver, @pages)
      end
    end
  end
end
