json.code @code
json.message @message
if @applies
  json.applies @applies.each do |a|
    time = a.created_at.strftime("%Y-%m-%d %T").to_s
    json.time time
    json.useravatar a.user.weno
    json.username a.user.wename
    json.userid a.user.id
  end
end
