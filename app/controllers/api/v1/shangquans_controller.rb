class Api::V1::ShangquansController < Api::V1::BaseController

  def index
    @city = City.all
  end


  def show
    @shangquans = Shangquan.where(quxian_id: params[:id])
  end

end
