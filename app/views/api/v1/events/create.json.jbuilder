json.code @code
json.message @message
json.(@event,:id,:title,:body,:num,:deadline,:post_id)
time = @event.created_at.strftime("%Y-%m-%d %T").to_s
json.time time
if @event.user
  json.userid @event.user.id
  json.userasset @event.user.weno
  json.username @event.user.wename
end
