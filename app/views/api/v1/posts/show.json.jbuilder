json.code @code
json.message @message
if @post
  json.post(@post,:id,:title,:xiaoqu_id)
  time = @post.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
  json.assets @post.postimgs, :asset
end
