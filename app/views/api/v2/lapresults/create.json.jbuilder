json.code @code
json.message @message
json.(@lap,:id,:child_id,:evaltime,:lap_id,:result,:comment)
la = Lap.find(@lap.lap_id)
json.month la.month
json.num la.code
json.content.content
