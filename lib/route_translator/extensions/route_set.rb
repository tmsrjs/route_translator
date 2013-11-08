require 'action_dispatch'

module ActionDispatch
  module Routing
    class RouteSet
      attr_accessor :localized

      alias_method :orig_add_route, :add_route
      def add_route(*args)
        if @localized
          add_localized_route(*args)
        else
          orig_add_route(*args)
        end
      end

      def add_localized_route(app, conditions = {}, requirements = {}, defaults = {}, as = nil, anchor = true)
        RouteTranslator::Translator.translations_for(app, conditions, requirements, defaults, as, anchor, self) do |*translated_args|
          orig_add_route(*translated_args)
        end
      end
    end
  end
end
