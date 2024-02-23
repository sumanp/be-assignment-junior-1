class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  has_many :user_expenses
  has_many :users, through: :user_expenses
end
