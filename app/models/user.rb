class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payer_expenses, class_name: 'Expense', foreign_key: 'payer_id'
  has_many :user_expenses
  has_many :expenses, through: :user_expenses
end
