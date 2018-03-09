json.code @code
json.message @message
json.(@pass,:id,:title,:leixing,:desc,:user_id,:asset)
time = @pass.created_at.strftime("%Y-%m-%d %T").to_s
json.time time
# json.assets @pass.passimgs,:asset
if @users
  json.user @users.each do |u|
    json.(u,:id,:weno,:wename)
  end
end
