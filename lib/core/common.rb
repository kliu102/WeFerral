module Core
    module Common
        def current_locale
            Settings.locale || 'US'
        end

        def try_current_user
            if respond_to?(:current_user)
                current_user
            else
                nil
            end
        end
    end
end