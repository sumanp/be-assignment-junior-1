module StaticHelper
  def amount_lent(expense)
    amount_paid_by_payer = expense.payer_record&.amount || 0.0
    (expense.amount - amount_paid_by_payer).round(2)
  end

end
