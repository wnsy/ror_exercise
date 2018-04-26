ActiveAdmin.register Stock do
  config.clear_sidebar_sections!

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  column 'User id', :user_id
  column 'Stock id', :id
  column :ticker
  column :created_at
  column :updated_at
end

end
