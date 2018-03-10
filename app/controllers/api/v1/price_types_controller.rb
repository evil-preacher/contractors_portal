class Api::V1::PriceTypesController < Api::V1::BaseController
  def batch_create
    PriceType.where(company_id: current_user.company.id).delete_all
    success = current_user.company.price_types.batch_create(request.raw_post)
    if success
      render json: {success: 'Типы цен добавлены'}, status: :created
    else
      render json: {failed: 'Типы цен не добавлены'}, status: :unprocessable_entity
    end
  end
end
