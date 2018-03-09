json.code @code
json.message @message
json.gross @gross.each do |a|
  json.(a,:id,:child_id,:evaltime,:lap_id,:result,:comment)
  la = Lap.find(a.lap_id)
  json.month la.month
  json.num la.code
  json.content la.content
end
json.fine @fine.each do |a|
  json.(a,:id,:child_id,:evaltime,:lap_id,:result,:comment)
  la = Lap.find(a.lap_id)
  json.month la.month
  json.num la.code
  json.content la.content
end
json.congnitive @congnitive.each do |a|
  json.(a,:id,:child_id,:evaltime,:lap_id,:result,:comment)
  la = Lap.find(a.lap_id)
  json.month la.month
  json.num la.code
  json.content la.content
end
json.language @language.each do |a|
  json.(a,:id,:child_id,:evaltime,:lap_id,:result,:comment)
  la = Lap.find(a.lap_id)
  json.month la.month
  json.num la.code
  json.content la.content
end
json.selfhelp @selfhelp.each do |a|
  json.(a,:id,:child_id,:evaltime,:lap_id,:result,:comment)
  la = Lap.find(a.lap_id)
  json.month la.month
  json.num la.code
  json.content la.content
end
json.social @social.each do |a|
  json.(a,:id,:child_id,:evaltime,:lap_id,:result,:comment)
  la = Lap.find(a.lap_id)
  json.month la.month
  json.num la.code
  json.content la.content
end
