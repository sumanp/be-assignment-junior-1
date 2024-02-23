class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User'
end
