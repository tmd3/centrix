class KasesController < ApplicationController
  # GET /kases
  # GET /kases.xml
  def index
    @controller = 'index'
    @kases = Kase.all
    @condition_string = nil
    render 'index'
  end

  # GET /kases/1
  # GET /kases/1.xml
  def show
    @kase = Kase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kase }
    end
  end

  # GET /kases/new
  # GET /kases/new.xml
  def new
    @kase = Kase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kase }
    end
  end

  # GET /kases/1/edit
  def edit
    @kase = Kase.find(params[:id])
  end

  # POST /kases
  # POST /kases.xml
  def create
    @kase = Kase.new(params[:kase])

    respond_to do |format|
      if @kase.save
        format.html { redirect_to(@kase, :notice => 'Case was successfully created.') }
        format.xml  { render :xml => @kase, :status => :created, :location => @kase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kases/1
  # PUT /kases/1.xml
  def update
    @kase = Kase.find(params[:id])

    respond_to do |format|
      if @kase.update_attributes(params[:kase])
        format.html { redirect_to(@kase, :notice => 'Case was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kases/1
  # DELETE /kases/1.xml
  def destroy
    @kase = Kase.find(params[:id])
    @kase.destroy

    respond_to do |format|
      format.html { redirect_to(kases_url) }
      format.xml  { head :ok }
    end
  end

  # PUT /kases/search
  def show_search_form
    @kase = Kase.new
    render 'search_form'
  end

  def condition_string_for_search_params(search_params)
    condition_string = ""
    search_params.each do
      |key,value|
      if value != "" then
        if Kase.columns_hash[key].type != :integer then
          value = "'" + value + "'"
        end
        condition_string += key + "=" + value + " and "
      end
    end
    if condition_string != "" then
      condition_string += "0=0"
    end
    return condition_string
  end

  # GET /kases/result
  def show_search_result
      @controller = 'show_search_result'
      @condition_string = condition_string_for_search_params(params[:kase])
      @kases = Kase.all(:conditions => @condition_string)
      render 'index'
  end

  # GET /kases/billed_until_passed
  def billed_until_date_passed
      now = Date.today
      @kases = [ ]
      Kase.all.each do
          |kase|
          if kase.billed_until_date < now then
              @kases.push(kase)
          end
          @kases.sort! { |a,b| a.billed_until_date <=> b.billed_until_date }
          @kases.reverse!
      end
      @condition_string = nil
      render 'index'
  end


end
