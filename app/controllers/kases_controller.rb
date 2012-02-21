class KasesController < ApplicationController

  def trace(msg)
    STDERR.puts("\n****************************************\n")
    STDERR.puts("TRACE: " + msg + "\n")
    STDERR.puts("\n****************************************\n\n")
    STDERR.flush
  end

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
    @previous_notes = string_of_all_notes_for_case(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kase }
    end
  end

  # GET /kases/new
  #
  def new
    @kase = Kase.new
    @previous_notes = ""
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
    case_id.destroy
    while prefix.size < 3 do prefix = '0' + prefix end
    suffix = params[:kase][:case_no]
    params[:kase][:case_no] = prefix + '-' + suffix
    @kase = Kase.new(params[:kase])
    #trace("case ID = " + @kase.id.to_s)

    respond_to do |format|
      if @kase.save
        save_case_note(@kase,params[:note])
        format.html { redirect_to(@kase, :notice => 'Case was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end

  end

  # METHOD save_case_note
  # ---------------------
  #
  def save_case_note(kase,note_text)

    if note_text != "" then
      note = CaseNote.new
      note.kase = kase.id
      note.note_text = note_text
      note.save
    end

  end

  # PUT /kases/1
  #
  # On entry from edit screen:
  #     params[:kase][:case_no_prefix] == <case no. prefix>
  #     params[:kase][:case_no]        == <ins.co.office abbr.>
  #
  def update

    prefix = params[:kase][:case_no_prefix]
    while prefix.size < 3 do prefix = '0' + prefix end
    suffix = params[:kase][:case_no]
    params[:kase][:case_no] = prefix + '-' + suffix
    @kase = Kase.find(params[:id])

    respond_to do |format|
      if @kase.update_attributes(params[:kase])
        save_case_note(@kase,params[:note])
        format.html { redirect_to(@kase, :notice => 'Case was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kase.errors, :status => :unprocessable_entity }
      end
    end

  end


  def string_of_all_notes_for_case(case_record_id)

    notes = ""
    CaseNote.find_all_by_kase(params[:id],:order=>"created_at DESC").each do
      |note|
      notes += "\n\n" + "Written on " + note.created_at.to_s
      if note.author != nil then
        notes += " by " + User.find(note.author).name
      end
      notes += "\n" + note.note_text
    end
    return notes

  end

  # GET /kases/1/edit
  def edit

    @kase = Kase.find(params[:id])
    @previous_notes = string_of_all_notes_for_case(params[:id])
    if @previous_notes == "" then
      @previous_notes = "\r(NO NOTES)\n"
    end
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

  # METHOD condition_string_for_search_params
  # -----------------------------------------
  # This method takes as input the params hash constructed by search_form.html.erb.
  # As output, it produces a SQL query expression, suitable as the :conditions parameter
  # in a Kase.all() invocation.
  #
  def condition_string_for_search_params(search_params)

      condition_string = ""

      search_params.each do
          |key,value|
          if value != "" then
              if Kase.columns_hash[key].type != :integer then
                  if key == 'product' then
                      # The value for this key is a substring that is contained in the name(s) of
                      # the desired product(s)...
                      condition_string += key + " LIKE '%" + value + "%' and "
                  elsif key == 'storage_volume' then
                      # The value for this key can be a single value, such as '3', or a range, such '3-5',
                      # standing for 3 or 4 or 5...
                      value = value.gsub( /  */, '')
                      if value.match(/\d+-\d+/) != nil then
                          limits = value.split( /-/ )
                          condition_string += key + " >= " + limits[0] + " and " + key + " <= " + limits[1] + " and "
                      else
                          condition_string += key + "=" + value + " and "
                      end
                  elsif key == 'date_received' then
                      # The value for this key is really just a year (see search_form.html.erb.).
                      # We search for any case recived in that year...
                      condition_string += key + " between '" + value + "-01-01' and '" + value + "-12-31'"
                  else
                      condition_string += key + "='" + value + "' and "
                  end
              end
          end
      end

      if condition_string != "" then
          # If there were any conditions, there will be a dangling 'and' at the end of the
          # conditions string. Here, we remove it.
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
