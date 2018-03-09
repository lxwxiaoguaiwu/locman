json.code @code
json.message @message
json.status @status
# if @user
#   json.user(@user, :id,:name,:asset)
# end
if @show
  json.show(@show,:id,:title,:asset)
end
