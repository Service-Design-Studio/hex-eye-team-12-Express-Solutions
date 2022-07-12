class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]
  before_action :validate_params


  # GET /services or /services.json
  def index
    #sort_by count
    
    @topServices = AllService.top_services()
    @allServices = AllService.all_category()
  end

  # GET /services/:id/sub
  def sub
    @services = AllService.where(category: params[:id])
    @category = params[:id]
    # @branch = params[:branch]
  end


  # def search 
  #   @search = params[:search]
  #   puts @search
  #   redirect_to services_url
  # end

  # GET /services/:id/time_estimate
  def time_estimate
    branch = session[:branch]
    @service = AllService.find(params[:id])
    @migratable = @service.migratable
    @digital_time = @service.digital_time
    @branch_time = @service.branch_time

    @branch_name = ""
    
    all_locations_name = Branch.all_locations_name
    if branch != nil
      branch_name = Branch.find_by(branch: branch).branch_name
      all_locations_name.delete(branch_name)
      all_locations_name.unshift(branch_name)
      @branch_name = branch_name
    end
    @all_locations_name = all_locations_name
  end

  # GET /services/:id/show_QR
  def show_QR
    
    #construct sms body here
    service = AllService.find(params[:id]).service
    branch = Branch.find_by(branch_name: params[:branch_name])
    session[:branch] = branch.branch
    branch_name = branch.branch_name
    sms_number = branch.sms_number
    if session[:ios]
      mobile_body = "/&"
      body = "sms:/+65#{sms_number}#{mobile_body}body=Q #{service}"
    else
      mobile_body = "?&"
      body = "sms:+65#{sms_number}#{mobile_body}body=Q #{service}"
    end
    
    # generate QR code
    @qr = RQRCode::QRCode.new(body).as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true,
      viewbox: true)
    @body = body
    #other 
    @service = AllService.find(params[:id])
    @branch_name = branch_name
    @mobile = session[:mobile]
  end
  
  # Get /services/more
  def more
    branch = session[:branch]
    @counter_types = ["Digital", "Branch"]
    all_locations_name = Branch.all_locations_name
    if branch != nil
      branch_name = Branch.find_by(branch: branch).branch_name
      all_locations_name.delete(branch_name)
      all_locations_name.unshift(branch_name)
    end
    @all_locations_name = all_locations_name
    @topic = ["Account Related","Cash Related","Non-Cash Related","Others"] #add db later
  end

  def more_QR
    
    #construct sms body here
    topic = params[:topic]
    branch = Branch.find_by(branch_name: params[:branch_name])
    session[:branch] = branch.branch
    branch_name = branch.branch_name
    sms_number = branch.sms_number
    if session[:ios]
      mobile_body = "/&"
      body = "sms:/+65#{sms_number}#{mobile_body}body=Q #{topic}"
    else
      mobile_body = "?&"
      body = "sms:+65#{sms_number}#{mobile_body}body=Q #{topic}"
    end
    
    # generate QR code
    @qr = RQRCode::QRCode.new(body).as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true,
      viewbox: true)
    @body = body
    #other 

    @branch_name = branch_name
    @mobile = session[:mobile]
    allServices = AllService.all_category()
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to service_url(@service), notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to service_url(@service), notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: "Service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :description, :requirements, :ttc, :service_id)
    end

    def validate_params
      validate_locations
      validate_user_agent
    end
    
    def validate_locations
      locations = Branch.all_locations
      branch = params[:branch]
      if (locations.include? branch)
        session[:branch] = branch
      end
    end

    def validate_user_agent
       #Check browser type
       uA = request.user_agent
       # because ios has a separate QR code
       session[:ios] = uA.include? "iPhone"
       # because mobile says "Tap" and web says "Scan"
       session[:mobile] = (uA.include? "iPhone") || (uA.include? "Android")
       session[:ua] = uA
    end

end

