class InsuranceCosController < ApplicationController
  # GET /insurance_cos
  # GET /insurance_cos.xml
  def index
    @insurance_cos = InsuranceCo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurance_cos }
    end
  end

  # GET /insurance_cos/1
  # GET /insurance_cos/1.xml
  def show
    @insurance_co = InsuranceCo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurance_co }
    end
  end

  # GET /insurance_cos/new
  # GET /insurance_cos/new.xml
  def new
    @insurance_co = InsuranceCo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurance_co }
    end
  end

  # GET /insurance_cos/1/edit
  def edit
    @insurance_co = InsuranceCo.find(params[:id])
  end

  # POST /insurance_cos
  # POST /insurance_cos.xml
  def create
    @insurance_co = InsuranceCo.new(params[:insurance_co])

    respond_to do |format|
      if @insurance_co.save
        format.html { redirect_to(@insurance_co, :notice => 'Insurance co was successfully created.') }
        format.xml  { render :xml => @insurance_co, :status => :created, :location => @insurance_co }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurance_co.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_cos/1
  # PUT /insurance_cos/1.xml
  def update
    @insurance_co = InsuranceCo.find(params[:id])

    respond_to do |format|
      if @insurance_co.update_attributes(params[:insurance_co])
        format.html { redirect_to(@insurance_co, :notice => 'Insurance co was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurance_co.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_cos/1
  # DELETE /insurance_cos/1.xml
  def destroy
    @insurance_co = InsuranceCo.find(params[:id])
    @insurance_co.destroy

    respond_to do |format|
      format.html { redirect_to(insurance_cos_url) }
      format.xml  { head :ok }
    end
  end
end
