class Api::V1::ProductsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    Product.where(company_id: current_user.company.id).delete_all
    success = current_user.company.products.batch_create(request.raw_post)
    if success
      render json: {success: 'Товары добавлены'}, status: :created
    else
      render json: {failed: 'Товары не добавлены'}, status: :unprocessable_entity
    end
  end
end
