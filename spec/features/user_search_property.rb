require 'rails helper'

feature 'search property by region' do
  scenario 'successfully' do
    amazonas = Region.create(name: 'Amazonas')
    apartamento = PropertyType.create(name: 'Apartamento')
    property = Property.create(title:'Apartamento para aluguel temporada', 
                                description: 'Lindo apartamento com vista para praia e sacada', 
                                property_type: apartamento,
                                region: amazonas, 
                                rent_purpose: 'férias', 
                                area: 10,
                                room_quantity: 2, 
                                accessibility: true, 
                                allow_pets: true, 
                                allow_smokers: true, 
                                maximum_guests: 3, 
                                minimum_rent: 1, 
                                maximum_rent: 20,
                                daily_rate: 500,
                                photo: File.new(Rails.root.join('spec', 'support','teste.jpg')))

    campos = Region.create(name: 'Campos')
    casa = PropertyType.create(name: 'Casa')
    property = Property.create(title:'Casa para aluguel temporada', 
                                description: 'Linda casa com vista para praia e sacada', 
                                property_type: casa,
                                region: casa, 
                                rent_purpose: 'férias', 
                                area: 10,
                                room_quantity: 2, 
                                accessibility: true, 
                                allow_pets: true, 
                                allow_smokers: true, 
                                maximum_guests: 3, 
                                minimum_rent: 1, 
                                maximum_rent: 20,
                                daily_rate: 500,
                                photo: File.new(Rails.root.join('spec', 'support','teste.jpg')))
   
    visit root_path
    click_on 'Buscar imóvel'
    fill_in 'Região', with: 'Amazonas'


  end
end