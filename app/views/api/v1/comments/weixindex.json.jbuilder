json.code @code
json.message @message
json.commentlenght @all_comments.length
json.weixins do
  json.id @commentable.id
  json.name @commentable.name
  json.weino @commentable.weino
  json.desc @commentable.desc
  json.ispub @commentable.ispub
  json.assets @commentable.weixinimgs,:asset
  time = @commentable.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
  json.xiaoqu_id @commentable.xiaoqu_id
  json.userid @commentable.user.id
  json.username @commentable.user.wename
  json.userasset @commentable.user.weno
end
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
