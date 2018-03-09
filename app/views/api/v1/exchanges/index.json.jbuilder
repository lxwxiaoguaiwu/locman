json.code @code
json.message @message
json.exchanges @exchanges.each do |e|
  time = e.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
  json.useravatar e.user.weno
  json.username e.user.wename
  json.desc e.desc

end
