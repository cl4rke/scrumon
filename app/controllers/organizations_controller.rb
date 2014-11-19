class OrganizationsController < ApplicationController
  def index
  	check_auth
  end

  def new
  	check_auth
  end

  def edit
  	check_auth
  end

  def show
  	check_auth
  	get_organization
  end

  def check_auth
  	@user = current_user
  	if @user.nil?
  		redirect_to sessions_new_path
  	end
  end

  def get_organization
  	@organization = Organization.find(params[:id])
  end
end
