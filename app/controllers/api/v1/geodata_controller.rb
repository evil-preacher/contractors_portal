class Api::V1::GeodataController < Api::V1::BaseController
  def index
    render json: @geodata = current_user.company.geodata
  end

  def create
    params["geodata"].each do |key, value|
      @geodatum = current_user.company.geodata.create(geodatum_params(value))
    end
    if @geodatum.save
      render json: {success: 'Маршруты выгружены'}, status: :created
    else
      render json: {failed: 'Маршруты не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def geodatum_params(my_params)
    my_params.permit( :sales_agent_asc,
                      :longitude,
                      :latitude,
                      :time )
  end
end
