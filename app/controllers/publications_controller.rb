class PublicationsController < ApplicationController
  before_filter :require_user, :except => [:show]

  def show
    @publication = Publication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @publication }
    end
  end

  def upvote
    @publication = Publication.find(params[:id])
    unless PointTransaction.already_given?(current_user, @publication)
      @publication.give_point!(current_user)
    end

    respond_to do |format|
      format.js
      format.xml { head :ok }
    end
  end

  def create
    @publication = Publication.new
    @publication.forest_id = params[:forest_id]
    @publication.branch_id = params[:id]
    @publication.user_id = current_user.id

    respond_to do |format|
      if @publication.save!
        format.html { redirect_to(@publication, :notice => 'Publication was successfully created.') }
        format.xml  { render :xml => @publication, :status => :created, :location => @publication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Publication.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(publications_url) }
      format.xml  { head :ok }
    end
  end
end
