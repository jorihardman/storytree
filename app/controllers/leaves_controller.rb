class LeavesController < ApplicationController
  before_filter :require_user

  def create
    @leaf = Leaf.new(params[:leaf])
    @leaf.parent_id = params[:id]
    @leaf.forest_id = params[:forest_id]
    @leaf.user_id = current_user.id

    respond_to do |format|
      if @leaf.save!
        format.js # create.js.erb
        format.xml  { render :xml => @leaf, :status => :created, :location => @leaf }
      else
        format.js # create.js.erb
        format.xml  { render :xml => @leaf.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @leaf = Leaf.find(params[:id])
    @leaf.destroy

    respond_to do |format|
      format.html { redirect_to(leaves_url) }
      format.xml  { head :ok }
    end
  end

  def show
    @leaf = Leaf.find(params[:id])
    @branch = Leaf.new
    @ancestors = @leaf.story.paginate :page => params[:story_page] || @leaf.last_page, :per_page => 5
    @branches = @leaf.children.order('points DESC').paginate :page => params[:branch_page], :per_page => 5

    if not @leaf.is_root? and flash[:last_leaf] == @leaf.parent
      flash[:last_leaf].give_point!(current_user)
    end
    flash[:last_leaf] = @leaf

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { head :ok }
    end
  end
end
