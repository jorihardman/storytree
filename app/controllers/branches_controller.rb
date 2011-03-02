class BranchesController < ApplicationController
  before_filter :require_user

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
    
    # Send email down the path back to the root.
    # This should probably be somewhere else, and
    # the call to 'deliver' seems to be a blocking call,
    # so we have to sit through this whole loop while emails
    # get sent out.
    @branch.ancestors.each do |ancestor|
      author = User.find(ancestor.user_id)
      UserMailer.subtree_update_email( author, ancestor ).deliver
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
    @ancestors = @branch.ancestors#.paginate :page => params[:story_page] || @branch.last_page, :per_page => 7
    @branches = @branch.children.order('points DESC')#.paginate :page => params[:branch_page], :per_page => 7

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
