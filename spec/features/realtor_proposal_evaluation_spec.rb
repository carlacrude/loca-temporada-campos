require 'rails_helper'

feature 'show proposals' do 
    scenario 'successfully' do

        region = Region.create(name: 'Copacabana')
        property_type = PropertyType.create(name: 'Apartamento')

        property = Property.create(title:'Apartamento para aluguel temporada', 
                                    description: 'Lindo apartamento com vista para praia e sacada', 
                                    property_type: property_type,
                                    region: region, 
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

        proposal = Proposal.create(start_date: '10-10-2017', 
                                    end_date: '15-10-2017',
                                    total_amount: 20,
                                    total_guests: 2,
                                    guest_name: 'Joaquina', 
                                    email: 'joaquina@teste,com', 
                                    phone: '11 9499592984', 
                                    rent_purpose: 'Férias com a família', 
                                    pet: true,
                                    smoker: false, 
                                    details: 'Levarei um bebê de 3 meses',
                                    property_id: property)
        
        visit root_path
        click_on 'Ver propostas'
        
        expect(page).to have_css('h1', text: property.title)
        expect(page).to have_css('li', text: proposal.guest_name)
        expect(page).to have_css('li', text: proposal.email)
        expect(page).to have_css('li', text: proposal.phone)
        expect(page).to have_css('li', text: proposal.start_date)
        expect(page).to have_css('li', text: proposal.end_date)
        expect(page).to have_css('li', text: proposal.total_guests)
        expect(page).to have_css('li', text: proposal.rent_purpose)
        expect(page).to have_css('li', text: proposal.pet)
        expect(page).to have_css('li', text: proposal.smoker)
        expect(page).to have_css('li', text: proposal.details)
        expect(page).to have_css('li', text: proposal.total_amout)
                                
    end
end