module ActiveAdmin
  class BaseController
    def determine_active_admin_layout
      'layouts/active_admin_reskin'
    end
  end
end