class Api::V1::CategoriesController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def create
    Category.where(company_id: current_user.company.id).delete_all
    params["categories"].each do |key, value|
      @category = current_user.company.categories.create(category_params(value))
    end
    if @category.save
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

  def category_params(my_params)
    my_params.permit(:accounting_system_code, :title, :parent_code)
  end
end
