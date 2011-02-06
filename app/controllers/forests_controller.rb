class ForestsController < ApplicationController
  # GET /forests
  # GET /forests.xml
  def index
    @forests = Forest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forests }
    end
  end

  # GET /forests/1
  # GET /forests/1.xml
  def show
    @forest = Forest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forest }
    end
  end

  # GET /forests/new
  # GET /forests/new.xml
  def new
    @forest = Forest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forest }
    end
  end

  # POST /forests
  # POST /forests.xml
  def create
    @forest = Forest.new(params[:forest])

    respond_to do |format|
      if @forest.save
        format.html { redirect_to(@forest, :notice => 'Forest was successfully created.') }
        format.xml  { render :xml => @forest, :status => :created, :location => @forest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forests/1
  # DELETE /forests/1.xml
  def destroy
    @forest = Forest.find(params[:id])
    @forest.destroy

    respond_to do |format|
      format.html { redirect_to(forests_url) }
      format.xml  { head :ok }
    end
  end
end
