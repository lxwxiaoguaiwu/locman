class Api::V3::GradevinsController < Api::V3::BaseController


  def index
    @gradevins = Gradevin.all
    zerornot(@gradevins)
  end


  def show
    gradevin = Gradevin.find(params[:id])
    if params[:page]
      goods = gradevin.gradgoods.where(status: "上架").page params[:page]
    else
      goods = gradevin.gradgoods.where(status: "上架")
    end
    zerornot(goods)
    if goods.length != 0
      @wines = Array.new
      @beers = Array.new
      @spirits = Array.new
      @foreign = Array.new
      goods.each do |g|
        leibie = g.category.leibie
        case leibie
        when "白酒"
          @spirits.push(g)
        when "洋酒"
          @foreign.push(g)
        when "红酒"
          @wines.push(g)
        when "啤酒"
          @beers.push(g)
        else
          puts "---------------"
        end
      end
    end
  end


  def create
    gradevin = Gradevin.new
    gradevin.name = params[:name]
    gradevin.code = SecureRandom.hex(10)
    gradevin.latitude = params[:latitude]
    gradevin.longitude = params[:longitude]
    gradevin.save
    saveornot(gradevin.reload)
  end
end
