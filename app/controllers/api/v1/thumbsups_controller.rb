class Api::V1::ThumbsupsController < Api::V1::BaseController
  before_action :authenticate_user!

  def create
    serman = Serman.find_by(post_id: params[:postid])
    record = Thumbsup.find_by(user_id: params[:userid],tag: params[:tag],serman_id: serman.id)
    if record
      @code = 10001
      @message = "已创建记录！"
    else
      newrecord = Thumbsup.new
      serman = Serman.find_by(post_id: params[:postid])
      newrecord.serman_id = serman.id
      newrecord.user_id = params[:userid]
      newrecord.tag = params[:tag]
      newrecord.desc = params[:desc]
      newrecord.save
      nullornot(newrecord.reload)
    end
  end

  def index
    allthumbs = Thumbsup.where(user_id: params[:userid])
    @allSermen = Array.new
    allthumbs.each do |a|
      serman = Serman.find(a.serman_id)
      @allSermen.push(serman)
    end
    zerornot(@allSermen)
  end
  # def index
  #   serman = Serman.find_by(post_id: params[:postid])
  #   if serman.tags.length != 0
  #     @tagthumbs = Hash.new
  #     serman.tags.each do |t|
  #       @tagthumbs[t.name] = Thumbsup.where(serman_id: serman.id,tag: t.name).length
  #     end
  #     @code = 10002
  #     @message ="请求成功！"
  #   else
  #     @code = 10001
  #     @message ="没有点赞记录！"
  #   end
  # end

end
