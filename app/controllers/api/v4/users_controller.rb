class Api::V4::UsersController < Api::V4::BaseController

  require "net/https"
  require "uri"
  require 'json'
  before_action :authenticate_user!, only: [:update,:allcomment,:allposts,:allsermen,:index,:show]

  def create
    uri = URI.parse("https://api.weixin.qq.com/sns/jscode2session?appid=wx9ef2fd5c4deabb55&secret=e559b824e899296d45db75bb26fea705&js_code=#{params[:js_code]}&grant_type=authorization_code");
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    obj = JSON.parse(response.body)
    session_key = obj['session_key']
    openid = obj['openid']

    if openid
      @user = User.find_by(openid: openid)
      if @user.blank?
        @user = User.new
        @user.openid = openid
        @user.wkey = session_key
        @user.responsebody = response.body
        @user.save
        saveornot(@user.reload)
      end

      xq_id = @user.xiaoqu_id
      @xq_name = ""
      @sq_id = ""
      @sq_name = ""

      if xq_id
        xiaoqu = Xiaoqu.find(xq_id)
        @xq_name = xiaoqu.name
        @sq_id = xiaoqu.shangquan_id
        @sq_name = xiaoqu.shangquan.name
      end

    else
      @code = "10001"
      @message = "未获取到openid!"
      wxsession = Wxsession.new
      wxsession.openid = response.body
      wxsession.wxkey = response
      wxsession.save
    end
  end

  def show
    if params[:id]
      begin
        @user = User.find(params[:id])
        if @user
          @code = "10002"
          @message = "请求成功！"
        end
      rescue Exception => e
        @code = 10001
        @message = e.message
      end
    else
      @code = 10001
      @message = "未传递用户id!"
    end
  end

  def index
    if params[:xiaoquid]
      @newusers = User.where(xiaoqu_id: params[:xiaoquid]).order(created_at: :DESC).take(3)
      @users = User.where(xiaoqu_id: params[:xiaoquid]).order(created_at: :ASC)
    else
      @users = User.all
      zerornot(@users)
    end

  end

  def allcomment
    if params[:id]
      @user = User.find(params[:id])
      @allcomments = Comment.where(user: @user).order(created_at: :DESC).page params[:page]
      zerornot(@allcomments)
    end
  end

  def allposts
    index = 0
    if params[:id]
      @user = User.find(params[:id])
      @allposts = Post.where(user: @user).order(updated_at: :desc)
      zerornot(@allposts)
    end
  end

  def allsermen
    if params[:id]
      @user = User.find(params[:id])
      @allsermen = Serman.where(user: @user)
      zerornot(@allsermen)
    end
  end


  def update
    @user = User.find(params[:id])
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
    params.require(:user).permit(:asset,:xiaoqu_id,:gender,:wename,:weno)
  end


end
