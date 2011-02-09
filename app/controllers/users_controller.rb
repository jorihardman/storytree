class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to my_account_path
    else
      render :action => :edit
    end
  end

  def my_account
  end
end
