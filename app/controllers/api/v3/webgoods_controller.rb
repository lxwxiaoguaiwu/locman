class Api::V3::WebgoodsController < Api::V3::BaseController
  def index
    @webgoods = Array.new
    Webgood.all.each do |g|
      leibie = g.category.leibie
      case leibie
      when params[:leibie]
        @webgoods.push(g)
      end
    end
  end

  def show
    @webgood = Webgood.find(params[:id])
    cate = Category.find(@webgood.category_id)
    @alcscores = Alcscore.where(alcohol_id: cate.alcohol.id)
    nullornot(@webgood)
  end
end
