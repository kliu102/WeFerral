module Core
  module Common
    def current_locale
      Settings.locale || 'US'
    end

    def try_current_user
      if respond_to?(:current_user)
        site_current_user
        # This one will be defined by Devise
      elsif respond_to?(:current_heron_user)
        current_site_user
      else
        nil
      end
    end
  end
end