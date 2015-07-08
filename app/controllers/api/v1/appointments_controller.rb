class Api::V1::AppointmentsController < ApplicationController
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]


  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = current_user.appointments
    respond_to do |format|
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    respond_to do |format|
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  def new
    @appointment = current_user.appointments.new
    respond_to do |format|
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    respond_to do |format|
      format.json { render json: @appointment }
    end
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = current_user.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.json { render json: @appointment, status: :ok, location: @appointment }
      else
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :time, :description)
    end
end
