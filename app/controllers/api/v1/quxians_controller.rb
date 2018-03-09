class Api::V1::QuxiansController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @quxians = Quxian.all
  end

  def show
    @quxians = Quxian.find(city_id: params[:id])
  end

end
