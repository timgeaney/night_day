class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    flash[:success] = "Welcome to Night & Day"
  else
    render 'new'
    end
  end
end
