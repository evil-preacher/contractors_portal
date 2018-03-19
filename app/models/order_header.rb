class OrderHeader < ApplicationRecord
  belongs_to :company
  has_many   :order_tables, dependent: :destroy, inverse_of: :order_header

  accepts_nested_attributes_for :order_tables

  # validates :imei, presence: true, uniqueness: true, length: { is: 15 }
  # validates :shop_id, presence: true

  def self.batch_create(orders)
    begin
      OrderHeader.transaction do
        JSON.parse(orders).each do |order|
          OrderHeader.create!(order)
        end
      end
    rescue
      # do nothing
    end
  end
end
