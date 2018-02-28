class Api::V1::BrandsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    success = current_user.company.brands.batch_create(request.raw_post)
    if success
      render json: {success: 'brands added'}, status: :created
    else
      render json: {failed: 'brands not added'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.brands.clear_all
  end
end
