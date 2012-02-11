class KasesController < ApplicationController
  # GET /kases
  # GET /kases.xml
  def index
    @kases = Kase.all
    @condition_string = nil
    @controller_method = 'index_method'
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
  #
  def new
    @kase = Kase.new
    @controller_method = 'new_method'
    render 'new'
  end

  # POST /kases
  #
  # On entry from new:
  #     params[:kase][:case_no_prefix] == nil
  #     params[:kase][:case_no]        == <ins.co.office abbr.>
  #
  def create

    case_id = KaseIdGenerator.new
    case_id.save
    prefix = case_id.id.to_s
    suffix = params[:kase][:case_no]
    params[:kase][:case_no] = prefix + '-' + suffix
    @kase = Kase.new(params[:kase])

    respond_to do |format|
      if @kase.save
        format.html { redirect_to(@kase, :notice => 'Case was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end

  end


  # PUT /kases/1
  #
  # On entry from edit:
  #     params[:kase][:case_no_prefix] == <case no. prefix>
  #     params[:kase][:case_no]        == <ins.co.office abbr.>
  #
  def update

    prefix = params[:kase][:case_no_prefix]
    suffix = params[:kase][:case_no]
    params[:kase][:case_no] = prefix + '-' + suffix
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


  # GET /kases/1/edit
  def edit
    @kase = Kase.find(params[:id])
    @controller_method = 'edit_method'
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

  #
  #
  def condition_string_for_search_params(search_params)

      condition_string = ""

      search_params.each do
          |key,value|
          if value != "" then
              if Kase.columns_hash[key].type != :integer then
                  if key == 'product' then
                      condition_string += key + " LIKE '%" + value + "%' and "
                  elsif key == 'storage_volume' then
                      value = value.gsub( /  */, '')
                      if value.match(/\d+-\d+/) != nil then
                          limits = value.split( /-/ )
                          condition_string += key + " >= " + limits[0] + " and " + key + " <= " + limits[1] + " and "
                      else
                          condition_string += key + "=" + value + " and "
                      end
                  else
                      condition_string += key + "='" + value + "' and "
                  end
              end
          end
      end

      if condition_string != "" then
          condition_string.sub!(/ *and $/,'')
      end

      return condition_string

  end

  # GET /kases/result
  #
  def show_search_result
      @condition_string = condition_string_for_search_params(params[:kase])
      @kases = Kase.all(:conditions => @condition_string)
      @controller_method = 'show_search_result_method'
      render 'index'
  end

  # GET /kases/billed_until_passed
  #
  def billed_until_date_passed
      now = Date.today
      @kases = [ ]
      Kase.all.each do
          |kase|
          if kase.billed_until_date != nil && (now - kase.billed_until_date).to_i > 90 then
              @kases.push(kase)
          end
      end
      @kases.sort! { |a,b| a.billed_until_date <=> b.billed_until_date }
      @condition_string = nil
      @controller_method = 'billed_until_date_passed_method'
      render 'index'
  end

  # GET /kases/quick
  #
  def quick
      key = params[:key]
      @kases = Kase.all(:conditions => "case_no LIKE '%" + key + "%' or claim_no LIKE '%" + key + "%' or insured_name LIKE '%" + key + "%'")
      @controller_method = 'quick_method'
      render 'index'
  end

end
