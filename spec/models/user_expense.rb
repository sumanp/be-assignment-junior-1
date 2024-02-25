require 'rails_helper'

RSpec.describe UserExpense, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:tax_amount) }
    it { should validate_numericality_of(:tax_amount).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:expense) }
  end

  describe 'methods' do
    let(:user) { create(:user) }
    let(:expense) { create(:expense) }
    let(:user_expense1) { create(:user_expense, user: user, expense: expense, amount: 50, tax_amount: 5) }
    let(:user_expense2) { create(:user_expense, user: user, expense: expense, amount: 30, tax_amount: 3) }

    before do
      user_expense1
      user_expense2
    end

    it 'calculates adjust_amount' do
      expect(user_expense1.adjust_amount).to eq(45)
    end
  end
end