class Api::V2::LapresultsController < Api::V2::BaseController

  def create
    @lap = Lapresult.new
    @lap.child_id = params[:childid]
    @lap.evaltime = Date.today
    @lap.lap_id = params[:lapid]
    item = Lap.find(params[:lapid])
    @lap.leibie = item.leibie
    @lap.result = params[:result].to_i
    @lap.comment = params[:comment]
    @lap.save
    saveornot(@lap.reload)
  end


  def initRecord
    @lap = Lapresult.new
    @lap.child_id = params[:childid]
    puts "--------------0---#{@lap.child_id}"
    @lap.evaltime = Date.today
    puts "--------------1---#{@lap.evaltime}"
    @lap.lap_id = params[:lapid]
    puts "--------------2---#{@lap.lap_id}"
    item = Lap.find(params[:lapid])
    puts "--------------3---#{item.id}"
    @lap.leibie = item.leibie
    puts "--------------4---#{@lap.leibie}"
    @lap.result = params[:result].to_i
    puts "--------------5---#{@lap.result}"
    @lap.comment = params[:comment]
    puts "--------------6---#{@lap.comment}"
    @lap.save
    puts "--------------7"
    saveornot(@lap.reload)
  end

  def index
    # @laps = Lapresult.where(child_id: params[:childid])
    @gross = Lapresult.where(result: 0,child_id: params[:childid],leibie: "大运动")
    @fine = Lapresult.where(result: 0,child_id: params[:childid],leibie: "精细运动")
    @congnitive = Lapresult.where(result: 0,child_id: params[:childid],leibie: "认知行为")
    @language = Lapresult.where(result: 0,child_id: params[:childid],leibie: "语言行为")
    @selfhelp = Lapresult.where(result: 0,child_id: params[:childid],leibie: "自理能力")
    @social = Lapresult.where(result: 0,child_id: params[:childid],leibie: "社会情绪")
    zerornot(@gross)
  end
end
