class Search < ApplicationRecord
  def products
    @products ||= find_products
  end

  private

  def find_products
    products = Product.order(:title)
    products = products.where("title like ?", "%#{keywords}%") if keywords.present?
    products = products.where(product_group_id: product_group_id) if product_group_id.present?
    products = products.where(brand_id: brand_id) if brand_id.present?
    products
  end
end
