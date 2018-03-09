class Api::V1::SwipperController < Api::V1::BaseController
  def index
    @swippers = Swipper.all
  end
end
