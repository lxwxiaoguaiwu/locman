class Api::V1::TagsController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @tags = Tag.order(taggings_count: :desc)
  end

end
