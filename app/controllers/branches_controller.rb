class BranchesController < ApplicationController
  before_filter :require_user

  def show
    @branch = Branch.find(params[:id])
    @new_branch = Branch.new
    @ancestors = @branch.ancestors
    @branches = @branch.children.includes(:user).select('branches.*, users.login').order('branches.points DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { head :ok }
    end
  end

  def create
    @branch = Branch.new(params[:branch])
    @branch.parent_id = params[:id]
    @branch.forest_id = params[:forest_id]
    @branch.user_id = current_user.id

    respond_to do |format|
      if @branch.save!
        format.js # create.js.erb
        format.xml  { render :xml => @branch, :status => :created, :location => @branch }
      else
        format.js # create.js.erb
        format.xml  { render :xml => @branch.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Branch.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(leaves_url) }
      format.xml  { head :ok }
    end
  end
end
