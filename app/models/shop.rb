class Shop < ApplicationRecord
  belongs_to :company

  has_many   :order_headers
  has_many   :routes

  validates :title, presence: true
  validates :asc, presence: true, length: { maximum: 20 }

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
end
