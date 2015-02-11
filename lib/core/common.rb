module Core
  module Common
    def current_locale
      Settings.locale || 'US'
    end

    def try_current_consumer
      if respond_to?(:current_consumer)
        current_consumer
      else
        nil
      end
    end
  end
end