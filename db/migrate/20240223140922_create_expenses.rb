class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :amount, :precision => 8, :scale => 2, default: 0.00
      t.integer :payer_id
      t.boolean :split_equally, default: false
      t.decimal :tax_rate, :precision => 5, :scale => 2, default: 0.00

      t.timestamps
      t.index :payer_id
    end
  end
end
