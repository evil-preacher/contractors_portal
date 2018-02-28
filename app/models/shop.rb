class Shop < ApplicationRecord
  belongs_to :company
  belongs_to :price_type

  has_many   :order_headers

  validates :title, presence: true
  validates :accounting_system_code, presence: true, length: { maximum: 20 }

  def self.batch_create(shops)
    begin
      Shop.transaction do
        JSON.parse(shops).each do |shop|
          Shop.create!(shop)
        end
      end
    rescue
      # do nothing
    end
  end

  def self.clear_all
    Shop.delete_all
  end
end
