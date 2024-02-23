class UserExpensesController < ApplicationController
  before_action :set_user_expense, only: [:edit, :update]

  def edit
  end

  def update
    if @user_expense.update(user_expense_params)
      redirect_to @user_expense.expense, notice: 'User expense was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user_expense
    @user_expense = UserExpense.find(params[:id])
  end

  def user_expense_params
    params.require(:user_expense).permit(:amount)
  end
end