require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should have_many :employee_tickets }
    it { should have_many :employees }
  end

  describe 'validations' do
    it { should validate_presence_of :subject }
    it { should validate_presence_of :age }
  end

  it 'returns tickets from oldest to youngest' do

    ticket_1 = Ticket.create!(subject: "Broken Copier", age: 5)
    ticket_2 = Ticket.create!(subject: "Undefined Method", age: 4)
    ticket_3 = Ticket.create!(subject: "Lost my Stapler", age: 6)

    expect(Ticket.ticket_order.first).to eq(ticket_3)
    expect(Ticket.ticket_order.last).to eq(ticket_2)
  end
end
