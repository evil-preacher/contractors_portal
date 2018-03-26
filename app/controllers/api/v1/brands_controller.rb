class Api::V1::BrandsController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def create
    Brand.where(company_id: current_user.company.id).delete_all
    params["brands"].each do |key, value|
      @brand = current_user.company.brands.create(brand_params(value))
    end
    if @brand.save
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

  def brand_params(my_params)
    my_params.permit(:accounting_system_code, :title)
  end
end
