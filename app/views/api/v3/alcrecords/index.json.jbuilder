json.alcrecords  @alcrecords .each do |a|
  json.username a.alcoholuser.wename
  json.avatar a.alcoholuser.weasset
  json.tagsc a.tagsc
end
