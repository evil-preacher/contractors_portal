class Category < ApplicationRecord
  belongs_to :company
  belongs_to :parent, class_name: "Category", optional: true, foreign_key: "parent_code", primary_key: "parent_code"

  has_many   :children, class_name: "Category", foreign_key: "parent_code", primary_key: "parent_code"

  validates :title, presence: true, length: { maximum: 50 }
  validates :accounting_system_code, presence: true, length: { maximum: 20 }

  def has_parent?
    parent_code != "" || nil
  end

  def has_children?
    children.exists?
  end
end
