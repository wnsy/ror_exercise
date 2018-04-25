module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin_user
      flash.clear
      redirect_to(admin_root_path) && return
    elsif current_business
      flash.clear
      redirect_to(stocks_path) && return
    end
  end
end
