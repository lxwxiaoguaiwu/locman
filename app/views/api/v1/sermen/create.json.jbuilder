json.code @code
json.message @message
if @serman
  json.(@serman,:id,:name,:phone,:desc,:gender,:post_id)
  time = @serman.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
end
