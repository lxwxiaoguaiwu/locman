class Api::V3::GradgoodsController < Api::V3::BaseController

  def show
    begin
      @gradgood = Gradgood.find(params[:id])
      cate = Category.find(@gradgood.category_id)
      @alcscores = Alcscore.where(alcohol_id: cate.alcohol.id)
      nullornot(@gradgood)
    rescue Exception => e
        @code = CERROR
        @message = e.message
    end
  end
end
