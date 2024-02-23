class ExpensesController < ApplicationController

  def create
    @expense = Expense.new(expense_params)
    if @expense.save!
      flash[:notice] = "Expense created successfully."
      redirect_to root_url
    else
      flash[:alert] = "Failed to create expense."
      render template: 'static/dashboard'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:payer_id, :description, :amount, :tax_rate, :split_equally, user_ids: [])
  end
end
