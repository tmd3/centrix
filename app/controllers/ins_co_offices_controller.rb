class InsCoOfficesController < ApplicationController
  # GET /ins_co_offices
  # GET /ins_co_offices.xml
  def index
    @ins_co_offices = InsCoOffice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ins_co_offices }
    end
  end

  # GET /ins_co_offices/for_co/<co :id>
  def show_for_parent
    @ins_co_offices = InsCoOffice.find_all_by_parent_co(params[:id])

    respond_to do |format|
      format.html # show_for_parent.html.erb
      format.xml  { render :xml => @ins_co_offices }
    end
  end

  # GET /ins_co_offices/1
  # GET /ins_co_offices/1.xml
  def show
    @ins_co_office = InsCoOffice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ins_co_office }
    end
  end

  # GET /ins_co_offices/new
  # GET /ins_co_offices/new.xml
  def new
    @ins_co_office = InsCoOffice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ins_co_office }
    end
  end

  # GET /ins_co_offices/1/edit
  def edit
    @ins_co_office = InsCoOffice.find(params[:id])
  end

  # POST /ins_co_offices
  # POST /ins_co_offices.xml
  def create
    @ins_co_office = InsCoOffice.new(params[:ins_co_office])

    respond_to do |format|
      if @ins_co_office.save
        format.html { redirect_to(@ins_co_office, :notice => 'Ins co office was successfully created.') }
        format.xml  { render :xml => @ins_co_office, :status => :created, :location => @ins_co_office }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ins_co_office.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ins_co_offices/1
  # PUT /ins_co_offices/1.xml
  def update
    @ins_co_office = InsCoOffice.find(params[:id])

    respond_to do |format|
      if @ins_co_office.update_attributes(params[:ins_co_office])
        format.html { redirect_to(@ins_co_office, :notice => 'Ins co office was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ins_co_office.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ins_co_offices/1
  # DELETE /ins_co_offices/1.xml
  def destroy
    @ins_co_office = InsCoOffice.find(params[:id])
    @ins_co_office.destroy

    respond_to do |format|
      format.html { redirect_to(ins_co_offices_url) }
      format.xml  { head :ok }
    end
  end
end
