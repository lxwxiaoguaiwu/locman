json.city @xiaoqus.each_pair do |k,v|
  json.shangquan(k, :id,:name,:pinyin,:quxian_id)
  json.xiaoqu(v,:id,:name,:location,:city_id,:quxian_id,:shangquan_id)
end
