json.code @code
json.message @message
json.sumcomment @allcomments.length
json.comments @allcomments.each do |c|
  json.id c.id
  json.title c.body
  json.commentable_id c.commentable_id
  time = c.updated_at.strftime("%Y-%m-%d %T").to_s
  json.time time
  json.userid c.user.id
  json.username c.user.wename
  json.userasset c.user.weno
end
