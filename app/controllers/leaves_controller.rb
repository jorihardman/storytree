class LeavesController < ApplicationController
  # GET /leaves
  # GET /leaves.xml
  def index
    @leaves = Leaf.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leaves }
    end
  end

  # GET /leaves/1
  # GET /leaves/1.xml
  def show
    @leaf = Leaf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leaf }
    end
  end

  # GET /leaves/new
  # GET /leaves/new.xml
  def new
    @leaf = Leaf.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leaf }
    end
  end

  # GET /leaves/1/edit
  def edit
    @leaf = Leaf.find(params[:id])
  end

  # POST /leaves
  # POST /leaves.xml
  def create
    @leaf = Leaf.new(params[:leaf])

    respond_to do |format|
      if @leaf.save
        format.html { redirect_to(@leaf, :notice => 'Leaf was successfully created.') }
        format.xml  { render :xml => @leaf, :status => :created, :location => @leaf }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leaf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leaves/1
  # PUT /leaves/1.xml
  def update
    @leaf = Leaf.find(params[:id])

    respond_to do |format|
      if @leaf.update_attributes(params[:leaf])
        format.html { redirect_to(@leaf, :notice => 'Leaf was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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
end
