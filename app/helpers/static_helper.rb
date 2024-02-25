module StaticHelper
  def amount_lent(expense)
    amount_paid_by_payer = expense.payer_record&.amount || 0.0
    total_amount_paid_by_payer = amount_paid_by_payer * (expense.tax_rate / 100)
    (expense.grand_total - amount_paid_by_payer).round(2)
  end

end
