class Api::V1::SermenController < Api::V1::BaseController
  before_action :authenticate_user!

  def create
    if params[:userid]
      begin
        @serman = Serman.new
        @serman.name = params[:name]
        @serman.phone = params[:phone]
        @serman.desc = params[:desc]
        @serman.tag_list.add(params[:tags])
        @serman.xiaoqu_id = params[:xiaoquid]
        @serman.shangquan_id = params[:sqid]
        @serman.user_id = params[:userid]
        @serman.tag = params[:tag]
        @serman.star = params[:star].to_i
        @serman.save
        nullornot(@serman.reload)
      rescue Exception => e
        @code = 10001
        @message = e.message
      end
    else
      @code = 10001
      @message = "未传递用户参数！"
    end
  end


  def index
    tag = params["tag"]
    xiaoquid = params["xiaoquid"]
    sqid = params["sqid"]
    userid = params["userid"]
    if xiaoquid
      # @users = User.where(xiaoqu_id: xiaoquid)
      @sermen = Serman.where(xiaoqu_id: xiaoquid).page params[:page]
    elsif sqid
      # @users = User.where(xiaoqu_id: xiaoquid)
      @sermen = Serman.where(xiaoqu_id: xiaoquid).page params[:page]
    elsif userid
      @sermen = Serman.where(user_id: userid).page params[:page]

    end
    if tag.blank?
      @sermen  = Serman.order(:id).page params[:page]
    else
      @sermen = Serman.where(tag: params[:tag],xiaoqu_id: params[:xiaoquid]).page params[:page]
    end
    zerornot(@sermen)
  end

  def show
    @serman = Serman.find(params[:id])
    nullornot(@serman)
  end
  def findbyphone
    @sermen = Serman.where(phone: params[:phone])
    zerornot(@sermen)
  end


end
