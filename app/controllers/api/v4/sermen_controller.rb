class Api::V4::SermenController < Api::V4::BaseController
  before_action :authenticate_user! ,only: [:update,:index,:show]

# 首页分类总数
  def sumserman
    @list = Array[0, 0, 0, 0]
    tags = Array["阿姨", "师傅", "私教","快递"]
    $i = 0
    while $i < @list.length  do
      @list[$i] = Serman.where(tag: tags.at($i)).length
      $i +=1
    end
    if @list.at(0) + @list.at(1) + @list.at(2) + @list.at(3) == 0
      @code = CEMPTY
      @message = MEMPTY
    else
      @code = CHAVEDATA
      @message = MHAVEDATA
    end
    # zerolist(@list)
  end

  def create
    if params[:userid]
      begin
        @serman = Serman.new
        @serman.name = params[:name]
        @serman.phone = params[:phone]
        @serman.desc = params[:desc]
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

  # 根据电话号码查找是否已经有该记录
  def findbyphone
    @sermen = Serman.where(phone: params[:phone])
    zerornot(@sermen)
  end

  private

  def zerolist(list)
    if list.at(0) + list.at(1) + list.at(2) + list.at(3) == 0
      @code = CEMPTY
      @message = MEMPTY
    else
      @code = CHAVEDATA
      @message = MHAVEDATA
    end
  end

end
