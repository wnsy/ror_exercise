ActiveAdmin.register Business do
  permit_params :email, :password, :password_confirmation
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
  column 'User id', :id
  column :email
  column :created_at
  column :last_sign_in_at
  column :last_sign_in_ip
  actions
end

end
