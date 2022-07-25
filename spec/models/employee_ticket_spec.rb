require 'rails_helper'

describe EmployeeTicket do
  describe "relationships" do
    it { should belong_to :employee }
    it { should belong_to :ticket }
  end
end
