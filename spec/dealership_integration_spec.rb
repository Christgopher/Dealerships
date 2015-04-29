require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the dealership website path', :type => :feature) do
  it('adds a dealership to the list') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Bob is Cars')
    click_button('Add Dealership')
    click_link('See Dealership List')
    expect(page).to have_content('Bob is Cars')
  end

  it('adds a car to the dealership') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Bob is Cars2')
    click_button('Add Dealership')
    click_link('See Dealership List')
    click_link('Bob is Cars2')
    click_link('Add a new vehicle')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Prius')
    fill_in('year', :with => '2000')
    click_button('Add Vehicle')
    click_link('See Dealership List')
    click_link('Bob is Cars')
    click_link('Toyota')
    expect(page). to have_content('Toyota Prius 2000')

  end
end
