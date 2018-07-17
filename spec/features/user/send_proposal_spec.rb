require 'rails_helper'

feature 'send proposal' do
    scenario 'successfully' do
        user = User.create(email: 'user@user.com', password: '123456')
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


        visit root_path
        click_on 'Login usuário'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Entrar'
 
        click_on region.name
        click_on 'Fazer proposta'

        fill_in 'Nome do locatário', with: 'Carla'
        fill_in 'Email do locatário', with: user.email
        fill_in 'Telefone do locatário', with: '99999999'
        fill_in 'Motivo da locação', with: 'Férias com a família'
        fill_in 'Data: início locação', with: '10-10-2017'
        fill_in 'Data: término da locação', with: '15-10-2017'
        fill_in 'Quantidade de hóspedes', with: 3
        check 'Permite animais?'
        check 'Permite fumantes?'
        fill_in 'Detalhes', with: 'Teste para envio de proposta'
        fill_in 'Valor total', with: '500.50'

        click_on 'Enviar proposta'

        
        expect(page).to have_css('h1', text: 'Formulário de proposta')
        expect(page).to have_css('li', text: 'Nome do locatário: Carla')
        expect(page).to have_css('li', text: 'Email do locatário: user@user.com')
        expect(page).to have_css('li', text: 'Telefone do locatário: 99999999')
        expect(page).to have_css('li', text: 'Motivo da locação: Férias com a família')
        expect(page).to have_css('li', text: 'Data: início da locação: 10-10-2017')
        expect(page).to have_css('li', text: 'Data: término da locação: 15-10-2017')
        expect(page).to have_css('li', text: 'Quantidade de hóspedes: 3')
        expect(page).to have_css('li', text: 'Permite animais? Sim')
        expect(page).to have_css('li', text: 'Permite fumantes? Sim')
        expect(page).to have_css('li', text: 'Detalhes: Teste para envio de proposta')
        expect(page).to have_css('li', text: 'Valor total: R$ 500.50')
        expect(page).to have_content('Proposta cadastrada com sucesso')
    end 
end
