require 'yamlwebdriver/driver/watir_driver'
require 'watir-webdriver'
require 'optparse'
require 'ostruct'
require 'headless'

module YamlWebDriver
  module Bootstrap
    class BootstrapOptions
      attr_accessor :headless
      attr_accessor :browser
      attr_accessor :leave_open
    end

    class Bootstrap

      # @return [YamlWebDriver::WatirDriver]
      def self.start
        options = BootstrapOptions.new
        optparse = create_options(options)
        optparse.parse!
        browser = Watir::Browser.new options.browser
        Driver::WatirDriver.new(options, browser)
      end

      def self.create_options(options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: ywd [options] FILES...'

          options.headless = false

          opts.on('-h', '--headless', 'Run in headless mode') do
            options.headless = true
            headless = Headless.new
            headless.start
            at_exit do
              headless.destroy
            end
          end

          options.browser = :firefox

          opts.on('-bBROWSER', '--browser=BROWSER', 'Specify browser') do |b|
            options.browser = b.to_sym
          end

          options.leave_open = false

          opts.on('-l', '--leave-open', 'Leave the browser window open when finished.') do
            if options.headless
              STDERR.puts 'headless mode not compatible with leave-open mode'
              exit 1
            end
            options.leave_open = true
          end

          opts.on('-?', '--help', 'Prints this help') do
            puts opts
            exit
          end
        end
      end

    end

  end
end