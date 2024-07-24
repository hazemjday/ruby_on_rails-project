class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin

  def index
   
  end

  private

  def verify_admin
    redirect_to root_path, alert: 'Vous n\'avez pas accès à cette page.' unless current_user.admin?
  end
end

class UserDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  
  end
end
