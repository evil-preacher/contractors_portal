class Api::V1::BrandsController < Api::V1::BaseController
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

  def brand_params(my_params)
    my_params.permit(:accounting_system_code, :title)
  end
end
