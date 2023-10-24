class Api::V1::CarsController < ApplicationController
  
  before_action :set_car, only: %i[show update destroy]
  
  def index
    @cars = Car.all
    render json: @cars
  end
  
  def show
    render json: @car
  end
  
  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created, location: api_v1_car_url(@car)
    else
      render json: @car.errors, status: :internal_server_error
    end
  end
  
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :internal_server_error
    end
  end
  
  def destroy
    @car.destroy
  end

private

def set_car
  @car = Car.find(params[:id])
end

def car_params
  params.require(:car).permit(:name, :age)
end
  
end
