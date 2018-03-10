class PriceType < ApplicationRecord
  belongs_to :company

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
end
