class Api::V1::ProductsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    success = current_user.company.products.batch_create(request.raw_post)
    if success
      render json: {success: 'products added'}, status: :created
    else
      render json: {failed: 'products not added'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.products.clear_all
  end
end
