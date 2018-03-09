json.code @code
json.message @message
if @pass
  json.(@pass,:id,:title,:leixing,:desc,:user_id,:asset)
  # json.assets @pass.passimgs, :asset
  time = @pass.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
end
