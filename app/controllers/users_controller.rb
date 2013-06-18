class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
    flash[:success] = "Welcome to Night & Day"
  else
    render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Destroyed"

    redirect_to users_url
  end
end
