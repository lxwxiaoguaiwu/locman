class Api::V3::AlcoholusersController < Api::V3::BaseController

  require "net/https"
  require "uri"
  require 'json'

  def create
    uri = URI.parse("https://api.weixin.qq.com/sns/jscode2session?appid=wx7be4244b6b0b43df&secret=70627e78167e0ff6ff5671bea1ae501f&js_code=#{params[:js_code]}&grant_type=authorization_code");
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    obj = JSON.parse(response.body)
    session_key = obj['session_key']
    openid = obj['openid']
    if openid
      @user = Alcoholuser.find_by(openid: openid)
      if @user.blank?
        @user = Alcoholuser.new
        @user.openid = openid
        @user.sessionkey = session_key
        @user.responsebody = response.body
        @user.save
        saveornot(@user.reload)
      end
    end
  end

  def allorders
    user = Alcoholuser.find(params[:userid])
    nullornot(user)
    @alreadypaids = Gradorder.where(alcoholuser_id: user.id,status: "已支付")
    @tobepaids = Gradorder.where(alcoholuser_id: user.id,status: "待支付")
    @webpaids = Weborder.where(alcoholuser_id: user.id,paystatus: "已支付");
    @topaids = Weborder.where(alcoholuser_id: user.id,paystatus: "待支付");
  end

  def update
    @user = Alcoholuser.find(params[:id])
    if @user
      @code = "10002"
      @message = "请求成功！"
      @user.update_attributes(update_params)
    else
      @code = "10001"
      @message = "没有该用户！"
    end
  end


  private

  def update_params
    params.require(:alcoholuser).permit(:wename,:weasset,:gender)
  end
end
