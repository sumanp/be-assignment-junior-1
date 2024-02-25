class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payer_expenses, class_name: 'Expense', foreign_key: 'payer_id', dependent: :destroy
  has_many :user_expenses, dependent: :destroy
  has_many :expenses, through: :user_expenses

  def total_amount_owed
    (user_expense_owed.sum(:amount) + user_expense_owed.sum(:tax_amount)).round(2)
  end

  def total_amount_you_owe
    (user_expense_you_owe.sum(:amount) + user_expense_you_owe.sum(:tax_amount)).round(2)
  end

  def total_balance 
    (total_amount_owed - total_amount_you_owe).round(2)
  end

  def user_expense_you_owe
    expense_ids_to_exclude = payer_expenses.pluck(:id)
    user_expenses.where.not(expense_id: expense_ids_to_exclude)
  end

  def user_expense_owed # expense paid by payer without payers share
    expense_ids_to_include = payer_expenses.pluck(:id)
    UserExpense.where(expense_id: expense_ids_to_include).where.not(user_id: self.id)
  end
end
