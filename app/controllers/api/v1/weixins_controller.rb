class Api::V1::WeixinsController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    xq_id = params["xq_id"]
    if xq_id
      @weixins = Weixin.where(xiaoqu_id:xq_id).order(created_at: :DESC).page params[:page]
    end
    if params[:userid]
      @weixins =Weixin.where(user_id: params[:userid]).order(created_at: :DESC).page params[:page]
    end
    zerornot(@weixins)
  end

  def create
    @weixin = Weixin.new
    @weixin.name = params[:name]
    @weixin.user_id = params[:userid]
    @weixin.weino = params[:wenum]
    @weixin.xiaoqu_id = params[:xq_id]
    @weixin.desc = params[:desc]
    @weixin.save
    nullornot(@weixin.reload)
  end

  def saveimgs
    asset_num = "asset" + params[:index].to_s
    asset = params["#{asset_num}"]
    savePic(params[:weixinid],asset)
  end


  def show
    if params[:id]
      @weixin  = Weixin.find(params[:id])
      nullornot(@weixin)
    end
  end

  private
  def savePic(weixinid,asset)
    image = Weixinimg.new
    image.weixin_id = weixinid
    image.asset = asset
    image.save
    nullornot(image.reload)
  end

end
