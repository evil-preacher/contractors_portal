class Api::V1::BrandsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    Brand.where(company_id: current_user.company.id).delete_all
    success = current_user.company.brands.batch_create(request.raw_post)
    if success
      render json: {success: 'Бренды добавлены'}, status: :created
    else
      render json: {failed: 'Бренды не добавлены'}, status: :unprocessable_entity
    end
  end
end
