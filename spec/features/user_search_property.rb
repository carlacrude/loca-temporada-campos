require 'rails helper'

feature 'search property' do
  scenario 'successfully' do
    region = Region.create(name: 'Saúde - SP')
    property_type = PropertyType.create(name: 'Apartamento')

    fill_in 'Título', with: 'Apartamento para temporada'
    fill_in 'Descrição' , with: 'Lindo apartamento'
 
    fill_in 'Área' , with: '' 
    fill_in 'Quantidade de cômodos' , with: '' 
    fill_in 'Possui acessibilidade' , with: '' 
    fill_in 'Aceita animais' , with: '' 
    fill_in 'Aceita fumantes' , with: '' 
    fill_in '' , with: '' 
   


  end
end