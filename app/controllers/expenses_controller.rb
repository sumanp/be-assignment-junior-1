class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show ]

  def show
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Success! Please adjust the contribution amount"
      redirect_to expense_url(@expense)
    else
      flash[:alert] = "Failed to create expense."
      render template: 'static/dashboard'
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:payer_id, :description, :amount, :tax_rate, :split_equally, user_ids: [])
  end
end
