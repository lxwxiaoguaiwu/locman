class Api::V1::ShowsController < Api::V1::BaseController
  before_action :authenticate_user!

  def create
    showitem = Show.last
    if showitem
      itemtime = showitem.created_at.to_s
      itemtime = itemtime[0,10]
      @today = Time.new
      todaystr = @today.strftime("%Y-%m-%d").to_s
      if itemtime.eql?(todaystr)
        @code = 10001
        @status = true
        # @user = User.find(showitem.user_id)
        @show = showitem
        @message = "已有人发送过早安招呼!"
      else
        @show = Show.new
        @show.user_id = params[:user_id]
        @show.save
        if @show
          puts "show.user_id = #{@show.user_id}"
          # @user = User.find(@show.user_id)
          @code = 10002
          @status = false
          @message = "早安招呼已发送成功！"
        else
          @code = 10001
          @status = true
          @message = "早安招呼发送失败！"
        end
      end
    end



  end
end
