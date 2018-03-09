class Api::V1::ShopsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    success = current_user.company.shops.batch_create(request.raw_post)
    if success
      render json: {success: 'Магазины добавлены'}, status: :created
    else
      render json: {failed: 'Магазины не добавлены'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.shops.clear_all
  end
end
