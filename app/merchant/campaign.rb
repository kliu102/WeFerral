ActiveAdmin.register Campaign, namespace: :merchant do
    menu label: I18n.t(:campaign), priority: 1
    permit_params :title, :description, :id
    scope_to :current_merchant_user, unless: proc{ current_merchant_user.admin? }
    scope :all, default: true
    scope :active
    scope('Inactive') { |scope| scope.where(status: 'inactive') }
    index do
        selectable_column
        column :title
        column :permalink
        column :start_at
        column :expired_at
        column :impressions_count
        actions dropdown: true
    end

    show do
        h3 campaign.title
        div do
            simple_format campaign.description
        end
    end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
