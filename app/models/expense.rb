class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  has_many :user_expenses, dependent: :destroy
  has_many :users, through: :user_expenses

  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :payer_id, presence: true
  validates :tax_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
 
  before_save :calculate_user_expense_amounts, if: :split_equally?
  attribute :amount, :float
  
  private

  def calculate_user_expense_amounts
    total_users = users.size + 1 # Include the payer
    total_amount = amount
    individual_amount = total_amount / total_users
    self.user_expenses.each do |user_expense|
      user_expense.amount = individual_amount
      user_expense.tax_amount = individual_amount * ( tax_rate / 100 )
    end
  end

end
