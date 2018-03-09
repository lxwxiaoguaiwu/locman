json.code @code
json.message @message
json.gradevins @gradevins.each do |g|
  json.(g,:id,:name,:status,:code,:latitude,:longitude)
end
