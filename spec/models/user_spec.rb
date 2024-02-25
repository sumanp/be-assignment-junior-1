require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:payer_expenses).class_name('Expense').with_foreign_key('payer_id').dependent(:destroy) }
    it { should have_many(:user_expenses).dependent(:destroy) }
    it { should have_many(:expenses).through(:user_expenses) }
  end

  describe 'methods' do
    let(:payer) { create(:user) }
    let(:user) { create(:user) }
    let(:expense1) { create(:expense, amount: 100, tax_rate: 10, payer: payer, split_equally: true) }
    let(:expense2) { create(:expense, amount: 50, tax_rate: 10) }
    let(:user_expense1) { create(:user_expense, user: payer, expense: expense1, amount: 50, tax_amount: 5) }
    let(:user_expense2) { create(:user_expense, user: user, expense: expense1, amount: 50, tax_amount: 5) }
    let(:user_expense3) { create(:user_expense, user: payer, expense: expense2, amount: 40, tax_amount: 4) }
    let(:user_expense4) { create(:user_expense, user: user, expense: expense2, amount: 10, tax_amount: 1) }

    before do
      user_expense1
      user_expense2
      user_expense3
      user_expense4
    end

    it 'calculates total amount owed' do
      expect(user.total_amount_owed).to eq(0)
    end

    it 'calculates total amount you owe' do
      expect(user.total_amount_you_owe).to eq(66.0)
    end

    it 'calculates total balance' do
      expect(user.total_balance).to eq(-66.0)
    end

    it 'returns user expense you owe' do
      expect(user.user_expense_you_owe).to include(user_expense2)
      expect(user.user_expense_you_owe).not_to include(user_expense1)
    end

    it 'returns user expense owed' do
      expect(payer.user_expense_owed).to include(user_expense2)
      expect(payer.user_expense_owed).not_to include(user_expense1)
    end
  end
end