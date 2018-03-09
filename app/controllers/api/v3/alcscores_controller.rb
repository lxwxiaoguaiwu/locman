class Api::V3::AlcscoresController < Api::V3::BaseController
  def index
    cate = Category.find(params[:categoryid])
    @alcscores = Alcscore.where(alcohol_id: cate.alcohol.id)
    zerornot(@alcscores)
  end
end
