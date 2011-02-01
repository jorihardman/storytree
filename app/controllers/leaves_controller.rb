class LeavesController < ApplicationController
  # POST /leaves
  # POST /leaves.xml
  def create
    new_leaf = Leaf.new(params[:leaf])

    respond_to do |format|
      if new_leaf.save
        @leaf = new_leaf.parent
        format.js # create.js.erb
        format.xml  { render :xml => @leaf, :status => :created, :location => @leaf }
      else
        format.js # create.js.erb
        format.xml  { render :xml => @leaf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.xml
  def destroy
    @leaf = Leaf.find(params[:id])
    @leaf.destroy

    respond_to do |format|
      format.html { redirect_to(leaves_url) }
      format.xml  { head :ok }
    end
  end

  # GET /leaves/1
  # GET /leaves/1.xml
  def show
    @leaf = Leaf.find(params[:id])
    @branch = Leaf.new
    @leaf.parent.add_points! if params[:climb] == true

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { head :ok }
    end
  end
end
