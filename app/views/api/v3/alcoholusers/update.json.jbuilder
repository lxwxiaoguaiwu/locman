json.code @code
json.message @message
if @user
  json.(@user,:id,:wename,:weasset)
end
