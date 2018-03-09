json. result do
  json.code  @code
  json.message @message
  json.hasone @hasone
end
if @show
  json.show(@show, :id,:title,:asset)
end
