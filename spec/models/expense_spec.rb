require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:payer_id) }
    it { should validate_numericality_of(:tax_rate).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }
  end

  describe 'associations' do
    it { should belong_to(:payer).class_name('User') }
    it { should have_many(:user_expenses).dependent(:destroy) }
    it { should have_many(:users).through(:user_expenses) }
  end

  describe 'methods' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:expense) { create(:expense, amount: 100, tax_rate: 10, payer: user1, users: [user1, user2]) }

    it 'calculates grand_total' do
      expect(expense.grand_total).to eq(110)
    end

    it 'calculates payer_record' do
      user_expense = expense.payer_record
      expect(user_expense.user_id).to eq(user1.id)
      expect(user_expense.expense_id).to eq(expense.id)
    end
  end
end