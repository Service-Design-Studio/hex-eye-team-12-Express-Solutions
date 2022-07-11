class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]
  before_action :validate_params

  def validate_params
    locations = ["Tampines-1", "Eunos"]
    branch = params[:branch]
    if (locations.include? branch)
      session[:branch] = params[:branch]
    else
      session[:branch] = nil
    end
  end

  # GET /services or /services.json
  def index
    #sort_by count
    @topServices = AllService.top_services()
    @allServices = AllService.all_category()
    # @branch = params[:branch]
    
  end

  # GET /services/:id/sub
  def sub
    @services = AllService.where(category: params[:id])
    @category = params[:id]
    # @branch = params[:branch]
  end

  # GET /services/:id/time_estimate
  def time_estimate
   
    @service = AllService.find(params[:id])
    @migratable = @service.migratable
    @digital_time = @service.digital_time
    @branch_time = @service.branch_time
    
    # @branch = params[:branch]
    
  end

  # Get /services/more
  def more
    @counter_types = ["Digital", "Branch"]

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
end

