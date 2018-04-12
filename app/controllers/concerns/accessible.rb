# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(new_admin_session_path) && return
			#redirect_to(rails_admin.dashboard_path) && return
    elsif current_business
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
			redirect_to(new_business_session_path) && return
    end
  end
end

#https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models
# Here we are redirecting and returning any user that is trying to access pages
# that are not specific to the type of user they are. Including this concern
# in your Sessions and Registrations Controller while performing this check
# as a before_action on your new methods is one simple way to setup multiple
#  users for devise.
