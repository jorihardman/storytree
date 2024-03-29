class SeedsController < ApplicationController
  before_filter :require_user

  # GET /seeds
  # GET /seeds.xml
  def index
    @seeds = Seed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seeds }
    end
  end

  # GET /seeds/1
  # GET /seeds/1.xml
  def show
    @branch = Seed.find(params[:id])
    @branch = Branch.new

    respond_to do |format|
      format.html { render 'leaves/show' }
      format.xml  { render :xml => @seed }
    end
  end

  # GET /seeds/new
  # GET /seeds/new.xml
  def new
    @seed = Seed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seed }
    end
  end

  # POST /seeds
  # POST /seeds.xml
  def create
    @seed = Seed.new(params[:seed])
    @seed.forest_id = params[:forest_id]
    @seed.user_id = current_user.id

    respond_to do |format|
      if @seed.save
        format.html { redirect_to(forest_seed_branch_path(@seed.forest_id, @seed.id, @seed.id), :notice => 'Seed was successfully created.') }
        format.xml  { render :xml => @seed, :status => :created, :location => @seed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seeds/1
  # DELETE /seeds/1.xml
  def destroy
    @seed = Seed.find(params[:id])
    @seed.destroy

    respond_to do |format|
      format.html { redirect_to(seeds_url) }
      format.xml  { head :ok }
    end
  end
end
