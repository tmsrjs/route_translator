require 'action_dispatch'

module ActionDispatch
  module Routing
    class Mapper
      def localized
        @set.localized = true
        yield
      ensure
        @set.localized = false
      end
    end
  end
end
