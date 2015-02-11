module Core
  module ControllerHelpers
    module Search
      def build_searcher(params)
        search_class.new(params).tap do |searcher|
          searcher.current_consumer = try_current_consumer
          searcher.current_locale = current_locale
        end
      end

      def search_class
        @search_class ||= Settings.search.search_class.constantize rescue Core::Search::Base
      end
    end
  end
end