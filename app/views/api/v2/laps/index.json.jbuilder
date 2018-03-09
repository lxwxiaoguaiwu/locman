json.code @code
json.message @message
json.laps @laps.each do |f|
  json.(f,:id,:month,:code,:content,:leibie)
end
# json.grossmotor @grossmotors.each do |g|
#   json.(g,:id,:month,:code,:content,:leibie)
# end
# json.socialemotional @socials.each do |s|
#   json.(s,:id,:month,:code,:content,:leibie)
# end
# json.selfhelp @selfhelps.each do |s|
#   json.(s,:id,:month,:code,:content,:leibie)
# end
# json.language @language.each do |l|
#   json.(l,:id,:month,:code,:content,:leibie)
# end
# json.congnitive @congnitive.each do |c|
#   json.(c,:id,:month,:code,:content,:leibie)
# end
