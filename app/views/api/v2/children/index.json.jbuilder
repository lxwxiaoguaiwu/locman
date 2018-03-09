json.code @code
json.message @message
json.children @children.each do |c|
  json.(c,:id,:name,:gender,:birthday,:avatar,:contact,:conphone,:starttime,:endtime,:desc)
  # xiaoqu = Xiaoqu.find(c.xiaoqu_id)
  # json.xiaoqu xiaoqu.name
end
