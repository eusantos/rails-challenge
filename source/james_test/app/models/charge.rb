class Charge < ApplicationRecord
  belongs_to :customer

  scope :paid, -> {where(paid: true)}
  scope :failed, -> {where(refunded: true)}
  scope :disputed, -> {where(disputed: true)}

  def amount_to_dollar
    amount.to_i / 100.0
  end
end
