class PriceList < ApplicationRecord
  belongs_to :company
  belongs_to :product, optional: true, class_name: "Product", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :price_type, optional: true, class_name: "PriceType", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :load_event, optional: true
  has_many :order_tables

  validates :price, presence: true, numericality: true

  def self.batch_create(price_lists)
    begin
      PriceList.transaction do
        JSON.parse(price_lists).each do |price_list|
          PriceList.create!(price_list)
        end
      end
    rescue
      # do nothing
    end
  end

  def self.clear_all
    PriceList.delete_all
  end
end
