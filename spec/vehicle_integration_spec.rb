require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the vehicle website path', :type => :feature) do
  it('adds a vehicle to the list') do
    visit('/')
    click_link('Add New Vehicle')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Prius')
    fill_in('year', :with => '2000')
    click_button('Add Vehicle')
    click_link('See Vehicle List')
    expect(page).to have_content('Prius')
  end
  it('adds a vehicle to the list') do
    visit('/')
    click_link('Add New Vehicle')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Corolla')
    fill_in('year', :with => '1999')
    click_button('Add Vehicle')
    click_link('See Vehicle List')
    click_link('Corolla')
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Corolla')
    expect(page).to have_content('1999')
  end
end
