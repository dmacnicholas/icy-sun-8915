require 'rails_helper'

RSpec.describe 'deparments index page' do
  #   Story 1
  # Department Index
  # As a user,
  # When I visit the Department index page,
  # I see each department's name and floor
  # And underneath each department, I can see the names of all of its employees
  it 'shows the name of all deparments and floor and all of its employees' do
    finance = Department.create!(name: "Finance", floor:"5th Floor")
    engineering = Department.create!(name: "Engineering", floor:"7th Floor")

    drew = Employee.create!(name: "Drew", level: 8, department_id: engineering.id)
    sally = Employee.create!(name: "Sally", level: 14, department_id: engineering.id)
    liam = Employee.create!(name: "Liam", level: 12, department_id: finance.id)
    stella = Employee.create!(name: "Stella", level: 10, department_id: finance.id)

    visit "/departments"

    # within "#department-#{engineering.id}" do
      expect(page).to have_content("Drew")
      expect(page).to have_content("Sally")
    # end

    # within "#department-#{finance.id}" do
      expect(page).to have_content("Liam")
      expect(page).to have_content("Stella")
    end
  end
