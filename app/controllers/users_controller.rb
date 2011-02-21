class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :index]

  def index
    @users = User.order('points DESC').limit(30)
  end

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

  def follow
    @relationship = UserRelationship.new
    @relationship.follower_id = current_user.id
    @relationship.guide_id = params[:id]

    respond_to do |format|
      if @relationship.save!
        format.js
        format.xml  { render :xml => @relationship, :status => :created }
      else
        format.js
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  def unfollow
    @relationship = UserRelationship.where({:follower_id => current_user.id, :guide_id => params[:id]}).first
    @relationship.destroy

    respond_to do |format|
        format.js { render 'follow' }
        format.xml { head :ok }
    end
  end
end
