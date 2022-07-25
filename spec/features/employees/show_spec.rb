require 'rails_helper'

RSpec.describe 'employees show page' do
#   Story 2
  # Employee Show
  # As a user,
  # When I visit the Employee show page,
  # I see the employee's name, department
  # and a list of all of their tickets from oldest to youngest.
  # I also see the oldest ticket assigned to the employee listed separately
  it 'shows employee name, department and their tickets from oldest to youngest' do
    finance = Department.create!(name: "Finance", floor:"5th Floor")
    engineering = Department.create!(name: "Engineering", floor:"7th Floor")

    drew = Employee.create!(name: "Drew", level: 8, department_id: engineering.id)
    sally = Employee.create!(name: "Sally", level: 14, department_id: engineering.id)
    liam = Employee.create!(name: "Liam", level: 12, department_id: finance.id)
    stella = Employee.create!(name: "Stella", level: 10, department_id: finance.id)

    ticket_1 = Ticket.create!(subject: "Broken Copier", age: 5)
    ticket_2 = Ticket.create!(subject: "Undefined Method", age: 4)
    ticket_3 = Ticket.create!(subject: "Lost my Stapler", age: 6)

    EmployeeTicket.create!(employee_id: drew.id, ticket_id: ticket_1.id)
    EmployeeTicket.create!(employee_id: drew.id, ticket_id: ticket_2.id)
    EmployeeTicket.create!(employee_id: drew.id, ticket_id: ticket_3.id)

    visit "/employees/#{drew.id}"

    expect(page).to have_content("Drew")
    expect(page).to have_content("Engineering")
    expect(page.text.index(ticket_3.subject) < page.text.index(ticket_1.subject))
    expect(page.text.index(ticket_1.subject) < page.text.index(ticket_2.subject))
  end
end
