class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout 'admin'

  def index

  end

  protected

  def check_admin
    redirect_to root_path, alert: 'No permission' unless current_user.admin?
  end
end