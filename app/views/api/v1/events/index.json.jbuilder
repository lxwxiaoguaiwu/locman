json.code @code
json.message @message
json.sumserman @events.length
if @events.length != 0
  json.events @events.each do |e|
    json.(e,:id,:body,:title,:deadline,:num)
    user = User.find(e.user_id)
    if user
      json.userid user.id
      json.userasset user.weno
      json.username user.wename
    end
  end
end
