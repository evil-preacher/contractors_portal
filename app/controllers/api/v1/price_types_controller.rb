class Api::V1::PriceTypesController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def create
    PriceType.where(company_id: current_user.company.id).delete_all
    params["price_types"].each do |key, value|
      @price_type = current_user.company.price_types.create(price_type_params(value))
    end
    if @price_type.save
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

  def price_type_params(my_params)
    my_params.permit(:accounting_system_code, :title)
  end
end
