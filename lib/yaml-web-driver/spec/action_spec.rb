
require 'yaml-web-driver/action/open_action'
require 'yaml-web-driver/action/alert_action'
require 'yaml-web-driver/action/click_action'

module YamlWebDriver
  module Spec
    class ActionSpec
      attr_reader :actions

      def initialize(specs)
        @actions = specs.flatten.map { |s|
          case s.keys.first
            when 'open';
              Action::OpenAction.new(s['open'])
            when 'click';
              Action::ClickAction.new(s['click'])
            when 'alert';
              Action::AlertAction.new(s['alert'])
            else
              raise ArgumentError, "unknown action #{s.keys.first}"
          end
        }
      end
    end
  end
end