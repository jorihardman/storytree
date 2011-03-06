class BranchesController < ApplicationController
  before_filter :require_user

  def create
    @branch = Branch.new(params[:branch])
    @branch.parent_id = params[:id]
    @branch.forest_id = params[:forest_id]
    @branch.user_id = current_user.id

    respond_to do |format|
      if @branch.save!
        if @branch.parent.user_id != current_user.id
          spawn do
            UserMailer.subtree_update_email(@branch.parent).deliver
          end
        end
        format.js # create.js.erb
        format.xml  { render :xml => @branch, :status => :created, :location => @branch }
      else
        format.js # create.js.erb
        format.xml  { render :xml => @branch.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to(leaves_url) }
      format.xml  { head :ok }
    end
  end

  def show
    @branch = Branch.find(params[:id])
    @new_branch = Branch.new
    @ancestors = @branch.ancestors
    @branches = @branch.children.joins(:user).select('branches.*, users.login').order('points DESC')

    if not @branch.is_root? and flash[:last_leaf] == @branch.parent
      flash[:last_leaf].give_point!(current_user)
    end
    flash[:last_leaf] = @branch

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { head :ok }
    end
  end
end
