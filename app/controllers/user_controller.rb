class UserController < ApplicationController
  def index
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  end
end
