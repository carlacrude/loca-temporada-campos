require 'rails_helper'

feature 'search property by region' do
  scenario 'successfully' do
    amazonas = Region.create(name: 'Amazonas')
    campos = Region.create(name: 'Campos')
    property_type_apartamento= PropertyType.create(name: 'Apartamento')
    property_type_casa = PropertyType.create(name: 'Casa')
    apartamento = Property.create(title:'Apartamento para aluguel temporada', 
                                description: 'Lindo apartamento com vista para praia e sacada', 
                                property_type: property_type_apartamento,
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
                                photo: File.new(Rails.root.join('spec', 'support','apartamento.jpg')))
    casa = Property.create(title:'Casa para aluguel temporada', 
                                description: 'Linda casa com vista para praia e sacada', 
                                property_type: property_type_casa,
                                region: campos, 
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
                                photo: File.new(Rails.root.join('spec', 'support','casa.jpg')))
                                
    visit root_path
    click_on 'Amazonas'
  
    expect(page).to have_css("img[src*='apartamento.jpg']")
    expect(page).to have_css('p', text: amazonas.name)
    expect(page).to have_css('p', text: apartamento.title)
    expect(page).to have_css('p', text: apartamento.maximum_guests)
    expect(page).to have_css('h1', text: apartamento.property_type.name)

    expect(page).to_not have_css("img[src*='casa.jpg']")
    expect(page).to_not have_css('p', text: campos.name)
    expect(page).to_not have_css('p', text: casa.title)
    expect(page).to_not have_css('p', text: casa.maximum_guests)
    expect(page).to_not have_css('h1', text: casa.property_type.name)
    expect(page).to have_ccontent("Nenhum imóvel cadastrado")
  end
end