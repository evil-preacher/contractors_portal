class PriceType < ApplicationRecord
  belongs_to :company
  has_many   :shops, dependent: :restrict_with_error
  has_many   :price_types, dependent: :restrict_with_error, class_name: "Pricetype", foreign_key: "price_type_accounting_system_code", primary_key: "price_type_accounting_system_code"

  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :title, presence: true

  def self.batch_create(price_types)
    begin
      PriceType.transaction do
        JSON.parse(price_types).each do |price_type|
          PriceType.create!(price_type)
        end
      end
    rescue
      # do nothing
    end
  end

  def self.clear_all
    PriceType.delete_all
  end
end
