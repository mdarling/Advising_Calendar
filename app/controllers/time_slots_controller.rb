class TimeSlotsController < ApplicationController
  # GET /time_slots
  # GET /time_slots.json
  
  before_filter :authenticate_user, :except => [:index]
  before_filter :catch_active_error, :except => [:index]
  
  def index
    @time_slots = TimeSlot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_slots }
    end
  end

  # GET /time_slots/1
  # GET /time_slots/1.json
  def show
    #begin
    	@time_slot = TimeSlot.find(params[:id])
		#rescue ActiveRecord::RecordNotFound
			#redirect_to time_slots_url
    #else
    	respond_to do |format|
      	format.html # show.html.erb
      	format.json { render json: @time_slot }
    	end
  	#end
  end

  # GET /time_slots/new
  # GET /time_slots/new.json
  def new
    @time_slot = TimeSlot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_slot }
    end
  end

  # GET /time_slots/1/edit
  def edit
    @time_slot = TimeSlot.find(params[:id])
  end

  # POST /time_slots
  # POST /time_slots.json
  def create
    @time_slot = TimeSlot.new(params[:time_slot])

    respond_to do |format|
      if @time_slot.save
        format.html { redirect_to time_slots_url, notice: 'Time slot was successfully created.' }
        format.json { render json: @time_slot, status: :created, location: @time_slot }
      else
        format.html { render action: "new" }
        format.json { render json: @time_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_slots/1
  # PUT /time_slots/1.json
  def update
    @time_slot = TimeSlot.find(params[:id])

    respond_to do |format|
      if @time_slot.update_attributes(params[:time_slot])
        format.html { redirect_to time_slots_url, notice: 'Time slot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_slots/1
  # DELETE /time_slots/1.json
  def destroy
    @time_slot = TimeSlot.find(params[:id])
    @time_slot.destroy

    respond_to do |format|
      format.html { redirect_to time_slots_url }
      format.json { head :no_content }
    end
  end

	def authenticate_user
			authenticate_or_request_with_http_basic do |name, password|
				name == "user" && password == "secret"
			end
	end
		
	def catch_active_error
		begin
    	@time_slot = TimeSlot.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to time_slots_url
		else
			true
		end
	end		

end
