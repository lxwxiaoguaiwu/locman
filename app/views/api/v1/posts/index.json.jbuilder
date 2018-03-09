json.code @code
json.message @message

if @posts.length != 0
  json.post @posts.each do |p|
      json.pid p.id
      json.ptitle p.title
      json.pleixing p.leixing
      json.passets p.postimgs, :asset
      time = p.created_at.strftime("%Y-%m-%d %T").to_s
      json.updatetime time
      json.uid p.user.id
      json.uname p.user.wename
      json.uasset p.user.weno
      @all_comments = Comment.where(commentable: p).order(updated_at: :desc)
      json.sumcomment  @all_comments.length
  end
end
