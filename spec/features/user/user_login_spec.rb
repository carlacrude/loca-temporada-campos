require 'rails_helper'

feature 'user login' do
    scenario 'successfully' do
        user = User.create(email: 'user@user.com', password:'123456')

        visit root_path
        click_on 'Login usuário'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Entrar'

        expect(page).to have_content('Signed in successfully.')
        expect(page).not_to have_content('Login')
    end

    scenario 'do not login with invalid e-mail' do
        user = User.create(email: 'user@user.com', password:'123456')

        visit root_path
        click_on 'Login usuário'
        fill_in 'Email', with: 'user2@user.com'
        fill_in 'Senha', with: user.password
        click_on 'Entrar'

        expect(page).to have_content('Invalid Email or password.')
        expect(page).to have_content('Login')
    end
end
