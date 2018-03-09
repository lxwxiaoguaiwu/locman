class Api::V1::LapsController < Api::V1::BaseController
  def index
    @lap = Lap.all
  end
end
