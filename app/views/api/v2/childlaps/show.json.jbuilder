# child = @childlap.child
# json.child do
#   json.id child.id
#   json.name child.name
#   json.gender child.gender
#   json.birthday child.birthday
#   json.avatar child.avatar
# end

if @childimgs.length != 0
  json.imgs @childimgs.each do |i|
    json.asset i.asset.url
    json.id i.id
  end
end
