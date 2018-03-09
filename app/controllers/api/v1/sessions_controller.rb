class Api::V1::SessionsController < Api::V1::BaseController

  def onlogin
    @user = User.find(3)
    xiaoqu = Xiaoqu.find(@user.xiaoqu_id)
    @xqname = Xiaoqu.find(@user.xiaoqu_id).name
    @sqname = xiaoqu.shangquan.name
  end
  def haslast
    showitem = Show.last
    if showitem
      itemtime = showitem.created_at.to_s
      itemtime = itemtime[0,10]
      @today = Time.new
      todaystr = @today.strftime("%Y-%m-%d").to_s
      if itemtime.eql?(todaystr)
        puts "showitem.user_id = #{showitem.user_id}"
        # @user = User.find(showitem.user_id)
        @show = showitem
        @code = 10002
        @message = "已有人发布！"
        @hasone = false
      else
        @code = 10001
        @message = "当前没有人发布！"
        @hasone = true
      end
    else
      @code = 10001
      @message = "当前没有人发布！"
      @hasone = true
    end
  end

  def create
    @user = User.find_by(openid: create_params[:openid])
    if @user
      self.current_user = @user
    else
      return api_error(status: 401)
    end
  end

  private

  def create_params
    params.require(:user).permit(:openid)
  end

end
