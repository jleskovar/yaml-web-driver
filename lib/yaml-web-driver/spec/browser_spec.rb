
require 'yaml-web-driver/runner/browser_spec_runner'
require 'yaml-web-driver/spec/action_spec'
require 'yaml-web-driver/spec/page_specs'

module YamlWebDriver
  module Spec
    class BrowserSpec
      attr_reader :main, :pages

      def initialize(browser_spec_docs)
        action_and_page_specs = browser_spec_docs.partition { |d| !d.is_a? Hash or !d.has_key? 'page' }
        @main = Spec::ActionSpec.new(action_and_page_specs[0])
        @pages = Spec::PageSpecs.new(action_and_page_specs[1])
      end

      def has_page?(page)
        @pages.has_page? page
      end

      def page(page)
        @pages[page]
      end

      # @return [yaml-web-driver::Runner::BrowserSpecRunner]
      def runner(driver)
        Runner::BrowserSpecRunner.new(driver, @main.actions, @pages)
      end
    end
  end
end