class Brand < ApplicationRecord
  has_many   :products, dependent: :restrict_with_error
  belongs_to :company

  validates :title, presence: true, length: { maximum: 50 }
  validates :accounting_system_code, presence: true, length: { maximum: 20 }

  def self.batch_create(brands)
    begin
      Brand.transaction do
        JSON.parse(brands).each do |brand|
          Brand.create!(brand)
        end
      end
    rescue
      # do nothing
    end
  end

  def self.clear_all
    Brand.delete_all
  end
end

