class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
  	@events = person.events

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    #@event = Event.find(params[:id])
    @event = person.events.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
   # @event = Event.new
   
      @event = person.events.build


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    #@event = Event.find(params[:id])
    @event = person.events.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
  #  @event = Event.new(params[:event])
    @event = person.events.new(params[:event])


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    #@event = Event.find(params[:id])
    @event = person.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    #@event = Event.find(params[:id])
    @event = person.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  
   def get_patient
    @patient = Patient.find(params[:patient_id])
  end
  
  def get_user
    @user = User.find(params[:user_id])
  end
  
  def person
    @person ||=
      if params[:user_id]
        User.find(params[:user_id])
      elsif params[:patient_id]
        Patient.find(params[:patient_id])
      end
  end
  
end
