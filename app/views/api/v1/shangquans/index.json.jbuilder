if @city
  json.city @city.each do |c|
    json.name c.name
    json.code c.id
    quxians = Quxian.where(city_id: c.id)
    if quxians
      json.subs quxians.each do |q|
        json.name q.name
        json.code q.id
        shangquans = Shangquan.where(quxian_id: q.id)
        if shangquans
          json.subs shangquans.each do |s|
            json.name s.name
            json.code s.id
          end
        end
      end
    end
  end
end
