class Category < ApplicationRecord
  belongs_to :company
  belongs_to :parent, class_name: "Category", optional: true, foreign_key: "parent_code", primary_key: "parent_code"

  has_many   :children, class_name: "Category", foreign_key: "parent_code", primary_key: "parent_code"
  has_many   :products, foreign_key: "accounting_system_code", primary_key: "accounting_system_code"

  validates :title, presence: true, length: { maximum: 50 }
  validates :accounting_system_code, presence: true, length: { maximum: 20 }

  def has_parent?
    parent_code != "" || nil
  end

  def has_children?
    children.exists?
  end

  def self.batch_create(categories)
    begin
      Category.transaction do
        JSON.parse(categories).each do |category|
          Category.create!(category)
        end
      end
    rescue
      # do nothing
    end
  end

  def self.clear_all
    Category.delete_all
  end
end
