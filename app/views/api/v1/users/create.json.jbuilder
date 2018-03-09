json.code @code
json.message @message
if @user
  json.(@user,:id,:phone,:wename,:weno,:gender,:xiaoqu_id)
  json.xqname @xq_name
  json.sqid @sq_id
  json.sqname @sq_name
  json.thirdkey @user.authentication_token
end
