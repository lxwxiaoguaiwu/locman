class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authenticate_user!

  def showscreate
    @show = Show.find(params[:id])
    @user_who_commented = User.find(params[:userid])
    @comment = Comment.new()
    @comment.commentable = @show
    @comment.user_id = params[:userid]
    @comment.body = params[:title]
    @comment.save
    nullornot(@comment.reload)
  end

  def postscreate
    @post = Post.find(params[:id])
    @user_who_commented = User.find(params[:userid])
    @comment = Comment.new()
    @comment.commentable = @post
    @comment.user_id = params[:userid]
    @comment.body = params[:title]
    @comment.save
    nullornot(@comment.reload)
  end

  def sermencreate
    @serman = Serman.find(params[:id])
    @user_who_commented = User.find(params[:userid])
    @comment = Comment.new()
    @comment.commentable = @serman
    @comment.user_id = params[:userid]
    @comment.body = params[:title]
    @comment.save
    nullornot(@comment.reload)
  end

  def weixincreate
    @weixin = Weixin.find(params[:id])
    @user_who_commented = User.find(params[:userid])
    @comment = Comment.new()
    @comment.commentable = @weixin
    @comment.user_id = params[:userid]
    @comment.body = params[:title]
    @comment.save
    nullornot(@comment.reload)
  end

  def passescreate
    @pass = Pass.find(params[:id])
    @user_who_commented = User.find(params[:userid])
    @comment = Comment.new()
    @comment.commentable = @pass
    @comment.user_id = params[:userid]
    @comment.body = params[:title]
    @comment.save
  end

  def showsindex
    if params[:showid]
      begin
        @commentable = Show.find_by(id: params[:showid])
        @all_comments = Comment.where(commentable: @commentable).order(updated_at: :desc).page params[:page]
        zerornot(@all_comments)
      rescue Exception => e
        @code = 10001
        @message = e.message
      end
    end
  end

  def postsindex
    if params[:postid]
      begin
        @commentable = Post.find_by(id: params[:postid])
        @all_comments = Comment.where(commentable: @commentable).order(updated_at: :desc).page params[:page]
        if @commentable.leixing == "event"
          @event = Event.find_by(post_id: @commentable.id)
          if params[:userid]
            apply = Apply.find_by(user_id: params[:userid],event_id: @event.id)
            if apply
              @userstatus = "您已报名"
            else
              @userstatus = "我要参加"
            end
          end
        elsif @commentable.leixing == "serman"
          @serman = Serman.find_by(post_id: @commentable.id)
          sumtags(@serman)
        end
        zerornot(@all_comments)
      rescue Exception => e
        @code = 10001
        @message = e.message
      end
    end
  end

  def weixindex
    begin
      @commentable = Weixin.find_by(id: params[:weixinid])
      @all_comments = Comment.where(commentable: @commentable).order(updated_at: :desc).page params[:page]
      zerornot(@all_comments)
    rescue Exception => e
        @code = 10001
        @message = e.message
    end
  end

  def passesindex
    begin
      @commentable = Pass.find_by(id: params[:passid])
      @all_comments = Comment.where(commentable: @commentable).order(updated_at: :desc).page params[:page]
      zerornot(@all_comments)
      if params[:userid]
        exchange = Exchange.find_by(user_id: params[:userid],pass_id: @commentable.id)
        if exchange
          @userstatus = "您已交换"
        else
          @userstatus = "我要交换"
        end
      end
    rescue Exception => e
        @code = 10001
        @message = e.message
    end
  end

  # def destroy
  #   comment = Comment.find(params[:id])
  #   comment.destroy
  #   if comment.frozen?
  #     @code = 10002
  #     @message = "删除成功！"
  #   else
  #     @code = 10001
  #     @message = "删除失败！"
  #   end
  # end


  private
  def sumtags(serman)
    if serman.tags.length != 0
      @tagthumbs = Hash.new
      serman.tags.each do |t|
        @tagthumbs[t.name] = Thumbsup.where(serman_id: serman.id,tag: t.name).length
      end
      @code = 10002
      @message ="请求成功！"
    else
      @code = 10001
      @message ="没有点赞记录！"
    end
  end
end
