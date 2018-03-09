json.code @code
json.message @message

if @event
  json.(@event,:id,:title,:body,:deadline,:num)
end
if @users
  json.sumuser  @users.length
  json.user @users.each do |u|
    json.(u,:wename,:weno)
  end
end
