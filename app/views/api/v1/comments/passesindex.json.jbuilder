json.code @code
json.message @message
if @all_comments
  json.commentlenght @all_comments.length
  json.comments @all_comments.each do |c|
    json.id c.id
    json.title c.body
    json.commentable_id c.commentable_id
    time = c.updated_at.strftime("%Y-%m-%d %T").to_s
    json.time time
    json.userid c.user.id
    json.username c.user.wename
    json.userasset c.user.weno
  end
end
if  @commentable
  json.pass do
    json.id @commentable.id
    json.title @commentable.title
    json.asset @commentable.asset
    json.status @userstatus 
    time = @commentable.created_at.strftime("%Y-%m-%d %T").to_s
    json.time time
    json.leixing @commentable.leixing
    json.userid @commentable.user.id
    json.username @commentable.user.wename
    json.userasset @commentable.user.weno
  end
end
