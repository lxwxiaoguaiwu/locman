json.code @code
json.message @message
json.sumserman @sermen.length

if @sermen.length != 0
  json.serman @sermen.each do |s|
    json.tags s.tags, :id, :name
    json.sumcomment Comment.where(commentable: s).length
    json.(s,:id,:phone,:name,:desc,:asset)
    time = s.created_at.strftime("%Y-%m-%d %T").to_s
    json.time time
  end
end
if @users
  json.sumuser @users.length
  json.user @users.each do |u|
    json.(u,:id,:phone,:wename,:gender,:weno,:xiaoqu_id)
    today = Time.new
    json.jointime ((today - u.created_at)/60/60/24).to_i
  end
end
