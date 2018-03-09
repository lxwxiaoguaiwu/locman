class Api::V1::AppliesController < Api::V1::BaseController
  before_action :authenticate_user!
  def create
    event = Event.find_by(post_id: params[:postid])
    if event
      appl = Apply.find_by(user_id: params[:userid],event_id: event.id)
    else
      @code = 10001
      @message = "参数错误！"
    end
    if appl
      @code = 10001
      @message = "您已申请过该活动"
    else
      @apply = Apply.new
      @apply.user_id = params[:userid]
      @apply.event_id = event.id
      @apply.desc = params[:desc]
      @apply.save
      nullornot(@apply.reload)
    end
  end

  def index
    event = Event.find_by(post_id: params[:postid])
    @applies = Apply.where(event_id: event.id)
    zerornot(@applies)
  end
end
