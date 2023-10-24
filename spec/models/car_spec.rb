require 'rails_helper'

RSpec.describe Car, type: :model do
  
  before {@car = Car.new}
  
  describe 'Teste de preenchimento dos campos do model Car' do
    
    it 'name consegue ser preenchido?' do
      @car.name = ""
      expect(@car.name).to eq("Opala")
    end
    
  end
  
end
