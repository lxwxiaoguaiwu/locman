class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    xq_id = params["xq_id"]
    @posts = Post.where(xiaoqu_id:xq_id).order(created_at: :DESC).page params[:page]
    zerornot(@posts)
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.user_id = params[:userid]
    @post.leixing = params[:leixing]
    @post.xiaoqu_id = params[:xq_id]
    @post.save
    nullornot(@post.reload)
  end

  def saveimgs
    post = Post.find(params[:postid])
    asset_num = "asset" + params[:index].to_s
    asset = params["#{asset_num}"]
    savePic(post.id,asset)
  end


  def show
    if params[:id]
      begin
        @post  = Post.find(params[:id])
      rescue Exception => e
        @code = 10001
        @message = e.message
      end
      nullornot(@post)
    end
  end

  def postlike
    @post = Post.find(params[:postid])
    user = User.find(params[:userid])
    @post.liked_by user
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
