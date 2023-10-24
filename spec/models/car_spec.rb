require 'rails_helper'

RSpec.describe Car, type: :model do
  
  before {@car = Car.new}
  
  describe 'Teste de preenchimento dos campos do model Car' do
    
    it 'name consegue ser preenchido?' do
      @car.name = "Opala"
      expect(@car.name).to eq("Opala")
    end
    
    it 'age consegue ser preenchida?' do
      @car.age = ""
      expect(@car.age).to eq("1974")
    end
    
  end
  
end
