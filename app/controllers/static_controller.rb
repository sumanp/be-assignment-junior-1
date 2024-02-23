class StaticController < ApplicationController
  def dashboard
    @expense = Expense.new
  end

  def person
  end
end
