require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  
  before {@car = Car.create(name: "Charger",age: "1970")}
  
  describe 'GET /api/v1/cars' do
    it 'Consegue listar todos os carros e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /api/v1/cars/id' do
    it 'Consegue listar um car especifico e retornar status 200?' do
      get :show, params: {id: @car.id}
      expect(response.body).to include_json(id: @car.id)
      expect(response).to have_http_status(200)
    end
  end
  
end
