class Car < ApplicationRecord
  validates :name, :age, presence: true
end
