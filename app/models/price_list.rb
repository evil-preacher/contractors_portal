class PriceList < ApplicationRecord
  belongs_to :company

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
