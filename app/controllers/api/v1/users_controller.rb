class Api::V1::UsersController < Api::V1::BaseController

  require "net/https"
  require "uri"
  require 'json'
  before_action :authenticate_user!, only: [:update,:allcomment,:allposts,:allsermen,:index,:show]

  def create
    # 认识邻居
    uri = URI.parse("https://api.weixin.qq.com/sns/jscode2session?appid=wx21dd0a49031fe0d9&secret=f05b0cf60cd38bf6e74822866eec9321&js_code=#{params[:js_code]}&grant_type=authorization_code")
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
        @code = "10002"
        @message = "success!"
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
      neighbors = User.where(xiaoqu_id: params[:xiaoquid]).order(created_at: :ASC)
      if neighbors.length != 0
        @users = neighbors
      else
        @code = "10001"
        @message = "没有记录！"
      end
    else
      users = User.all
      if users.length != 0
        @users = users
        @code = "10002"
        @message = "请求成功！"
      else
        @code = "10001"
        @message = "没有记录！"
      end
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
