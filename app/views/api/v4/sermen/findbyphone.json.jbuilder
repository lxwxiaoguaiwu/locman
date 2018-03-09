json.code @code
json.message @message
json.serman @sermen.each do |s|
  json.(s,:id,:name,:asset,:tag,:phone,:desc)
end
