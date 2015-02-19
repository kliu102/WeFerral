ActiveAdmin.register Campaign, namespace: :merchant do
    menu label: I18n.t(:campaign), priority: 1
    permit_params :title, :description, :id
    scope_to :current_merchant_user, unless: proc { current_merchant_user.admin? }
    scope proc { I18n.t('active_admin.all') }, :all, default: true
    scope proc { I18n.t('active_admin.active') }, :active
    scope (I18n.t('active_admin.inactive')) { |scope| scope.where(status: 'inactive') }

    form partial: 'campaigns/form', :locals => {:campaign => @campaign}

    index do
        selectable_column
        column I18n.t('active_admin.title'), :title
        column I18n.t('active_admin.permalink'), :permalink
        column I18n.t('active_admin.start_at'), :start_at
        column I18n.t('active_admin.expired_at'), :expired_at
        column I18n.t('active_admin.impressions_count'), :impressions_count
        actions dropdown: true
    end

    # show do
    #     h3 campaign.title
    #     div do
    #         simple_format campaign.description
    #     end
    # end

    # show do
    #     attributes_table do
    #         row :title
    #         row :image do |campaign|
    #             image_tag campaign.master_image.image_file_name
    #         end
    #     end
    #     active_admin_comments
    # end

    show do
        tabs do
            tab 'Overview' do
                table_for campaign do
                column I18n.t('active_admin.title'), :title
                column I18n.t('active_admin.description'), :description
            end
        end
            tab 'Status' do
                render :partial => 'shared/campaign_statistics', :locals => {:campaign => campaign}
            end
        end
    end

    sidebar :help do
        "Need help? Email us at help@example.com"
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
