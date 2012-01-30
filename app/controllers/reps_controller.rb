class RepsController < ApplicationController
  # GET /reps
  # GET /reps.xml
  def index
    @reps = Rep.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reps }
    end
  end

  # GET /reps/1
  # GET /reps/1.xml
  def show
    @rep = Rep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rep }
    end
  end

  # GET /reps/new
  # GET /reps/new.xml
  def new
    @rep = Rep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rep }
    end
  end

  # GET /reps/1/edit
  def edit
    @rep = Rep.find(params[:id])
  end

  # POST /reps
  # POST /reps.xml
  def create
    @rep = Rep.new(params[:rep])

    respond_to do |format|
      if @rep.save
        format.html { redirect_to(@rep, :notice => 'Rep was successfully created.') }
        format.xml  { render :xml => @rep, :status => :created, :location => @rep }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reps/1
  # PUT /reps/1.xml
  def update
    @rep = Rep.find(params[:id])

    respond_to do |format|
      if @rep.update_attributes(params[:rep])
        format.html { redirect_to(@rep, :notice => 'Rep was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reps/1
  # DELETE /reps/1.xml
  def destroy
    @rep = Rep.find(params[:id])
    @rep.destroy

    respond_to do |format|
      format.html { redirect_to(reps_url) }
      format.xml  { head :ok }
    end
  end
end
