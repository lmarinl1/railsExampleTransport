class Api::DemandsController < ApplicationController
	skip_before_action :verify_authenticity_token
  	before_action :set_demand, only: [:show, :update, :destroy]

  # GET /demands
  def index
    @demands = Demand.all

    render json: @demands
  end

  # GET /demands/1
  def show
    render json: @demand
  end

  # POST /demands
  def create
    @demand = Demand.new(demand_params)

    if @demand.save
      render json: @demand, status: :created, location: @demand
      # 201  created - La petición ha sido completada y ha resultado en la creación de un nuevo recurso.
    else
      render json: @demand.errors, status: :unprocessable_entity
      # 422 Unprocessable Entity - La solicitud está bien formada pero fue imposible seguirla debido a errores semánticos.
    end
  end

  # PATCH/PUT /demands/1
  def update
    if @demand.update(demand_params)
      render json: @demand
    else
      render json: @demand.errors, status: :unprocessable_entity
      # 422 Unprocessable Entity - La solicitud está bien formada pero fue imposible seguirla debido a errores semánticos.
    end
  end

  # DELETE /demands/1
  def destroy
    @demand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def demand_params
      params.permit(:category, :plate, :score, :comment)
    end
  
end
