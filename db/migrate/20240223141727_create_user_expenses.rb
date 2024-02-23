class CreateUserExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_expenses do |t|
      t.references :user, foreign_key: true
      t.references :expense, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2, default: 0.00
      t.decimal :tax_amount, precision: 8, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
