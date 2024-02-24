class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy]

  def show
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Expense created successfully."
      redirect_to expense_url(@expense)
    else
      flash[:alert] = "Failed to create expense."
      render template: 'static/dashboard'
    end
  end

  def destroy
    @expense.destroy
    flash[:notice] = "Expense successfully removed"
    redirect_back(fallback_location: root_path)
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:payer_id, :description, :amount, :tax_rate, :split_equally, user_ids: [])
  end
end
