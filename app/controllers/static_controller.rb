class StaticController < ApplicationController
  def dashboard
    @expense = Expense.new
    @friends = User.all # TODO: This will be paginated
  end

  def person
    user = User.find(params[:id])
    @expenses = user.payer_expenses  # TODO: This will be paginated as well
    @friends = User.all # TODO: This will be paginated
  end
end
