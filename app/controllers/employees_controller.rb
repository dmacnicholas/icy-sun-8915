class EmployeesController < ApplicationController
  def index
  end
  def show
    @employee = Employee.find(params[:id])
    @tickets = @employees.tickets.ticket_order
  end

end
