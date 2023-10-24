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
  
  describe 'POST /api/v1/cars' do
    it 'Consegue criar um car e retornar status 201?' do
      post :create, params: {car: {name: @car.name, age: @car.age},format: :json}
      
      expect(response.body).to include_json(name: @car.name)
      expect(response).to have_http_status(201)
    end
  end
  
  describe 'PATCH /api/v1/cars/id' do
    it 'Consegue atualizar um car e retornar status 200?' do
      car = Car.last
      patch :update, params: {car: {name: "kombi", age: "1980"},id: car.id}
      
      expect(response.body).to include_json(name: "kombi")
      expect(response).to have_http_status(200)
    end
  end
  
end
