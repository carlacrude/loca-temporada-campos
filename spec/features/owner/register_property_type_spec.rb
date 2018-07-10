require 'rails_helper'

feature 'Register Property Type' do
  scenario 'successfully' do
    visit new_property_type_path
    fill_in 'Name', with: 'Apartamento'
    click_on 'Cadastrar'

    expect(page).to have_css('h1', text: 'Apartamento')
  end

  scenario 'and leave blank fields' do
    visit new_property_type_path
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
