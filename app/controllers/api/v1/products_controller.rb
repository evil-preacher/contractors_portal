class Api::V1::ProductsController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def create
    Product.where(company_id: current_user.company.id).delete_all
    params["products"].each do |key, value|
      @product = current_user.company.products.create!(product_params(value))
    end
    if @product.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def wrap_in_transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      ensure
        raise ActiveRecord::Rollback
      end
    end
  end

  def product_params(my_params)
    my_params.permit(:accounting_system_code, :title, :barcode, :company_id, :category_accounting_system_code, :brand_accounting_system_code)
  end
end
