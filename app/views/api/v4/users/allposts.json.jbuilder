json.code @code
json.message @message
json.sumposts @allposts.length
json.posts @allposts.each do |p|
  json.id p.id
  json.title p.title
  json.asset p.postimgs, :asset
  json.leixing p.leixing
  time = p.created_at.strftime("%Y-%m-%d %T").to_s
  json.created_at time
  json.username p.user.wename
  json.userasset p.user.weno
  json.sumcomment Comment.where(commentable: p).length
  json.sumthumb 10
end
