class Api::V1::CarsController < ApplicationController
  
  before_action :set_car, only: %i[show update destroy]
  
  def index
    @cars = Car.all
    render json: @cars
  end

private

def set_car
  @car = Car.find(params[:id])
end

def car_params
  params.require(:car).permit(:name, :age)
end
  
end
