require 'faker'

puts 'Gerando cars...'

10.times do |i|
  Car.create(
    name: ["charger r/t", "opala", "maverick"].sample, 
    age: rand(1970..1974)    
    )
end

puts 'cars gerados com sucesso!'
