class PublicationsController < ApplicationController
  before_filter :require_user

  def index
    @publications = Publication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publications }
    end
  end

  def show
    @publication = Publication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @publication }
    end
  end

  def create
    @publication = Publication.new
    @publication.forest_id = params[:forest_id]
    @publication.branch_id = params[:branch_id]
    @publication.user_id = params[:user_id]

    respond_to do |format|
      if @publication.save
        format.html { redirect_to(@publication, :notice => 'Publication was successfully created.') }
        format.xml  { render :xml => @publication, :status => :created, :location => @publication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to(publications_url) }
      format.xml  { head :ok }
    end
  end
end
