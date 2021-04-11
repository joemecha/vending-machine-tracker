class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def avg_snack_price
    result = snacks.average(:price)
    if result
      "$" + sprintf("%.2f", result)
    else
      "$0.00"
    end
  end

  def qty_snacks
    snacks.select(:name)
          .distinct
          .count

    # snacks.group(:name).pluck(:name).count
  end
end
