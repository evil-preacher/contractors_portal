class SalesAgent < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :IMEI, presence: true, uniqueness: true, length: { is: 15 }

  def self.batch_create(sales_agents)
    begin
      SalesAgent.transaction do
        JSON.parse(sales_agents).each do |sales_agent|
          SalesAgent.create!(sales_agent)
        end
      end
    rescue
      # do nothing
    end
  end
end
