json.code @code
json.message @message
if @serman.created_at
  json.(@serman,:id,:name,:phone,:desc,:gender,:star,:tag)
  json.username User.find(@serman.user_id).wename
  json.xiaoqu Xiaoqu.find(@serman.xiaoqu_id).name
  time = @serman.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
end
