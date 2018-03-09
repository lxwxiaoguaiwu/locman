class Api::V1::EventsController < Api::V1::BaseController
  before_action :authenticate_user!
  
  def create
    @event = Event.new
    @event.title = params[:title]
    @event.body = params[:body]
    @event.deadline = params[:deadline]
    @event.num = params[:num]
    @event.xiaoqu_id = params[:xiaoquid]
    @event.user_id = params[:userid]
    @event.save
    nullornot(@event.reload)
  end


  def saveimgs
    post = Post.find(params[:postid])
    asset_num = "asset" + params[:index].to_s
    asset = params["#{asset_num}"]
    savePic(post.id,asset)
  end

  def index
    xiaoquid = params["xiaoquid"]
    if xiaoquid
      @events = Event.where(xiaoqu_id: xiaoquid).page params[:page]
    else
      @events = Event.all.page params[:page]
    end
    zerornot(@events)
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
  end


  private

  def savePic(postid,asset)
    image = Postimg.new
    image.post_id = postid
    image.asset = asset
    image.save
    nullornot(image.reload)
  end
end
