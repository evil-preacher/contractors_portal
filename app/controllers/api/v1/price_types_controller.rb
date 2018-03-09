class Api::V1::PriceTypesController < Api::V1::BaseController
  def batch_create
    success = current_user.company.price_types.batch_create(request.raw_post)
    if success
      render json: {success: 'Типы цен добавлены'}, status: :created
    else
      render json: {failed: 'Типы цен не добавлены'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.price_types.clear_all
  end
end
