class Api::V3::AlcrecordsController < Api::V3::BaseController
  def create
    @alcrecord = Alcrecord.new
    cate = Category.find(params[:categoryid])
    @alcrecord.alcohol_id = cate.alcohol.id
    @alcrecord.alcoholuser_id = params[:userid]
    @alcrecord.tagsc = params[:tagsc]
    @alcrecord.save
    saveornot(@alcrecord.reload)
    if params[:leibie] == 'g'
      @order = Gradorder.find(params[:orderid])
      @order.status = "已完成"
      @order.save
    else
      @order = Weborder.find(params[:orderid])
      @order.paystatus = "已完成"
      @order.save
    end
    initAlscore(@alcrecord.reload)
  end

  def index
    cate = Category.find(params[:categoryid])
    alcoholid = cate.alcohol.id
    puts "======alcoholid======#{alcoholid}"
    @alcrecords = Alcrecord.where(alcohol_id: alcoholid)
    zerornot(@alcrecords)
  end


  private

  def initAlscore(record)
    tags = record.tagsc.split(",")
    tags.each do |t|
      alcscore = Alcscore.find_or_create_by(code: t, alcohol_id: record.alcohol_id )
      alcscore.code = t.to_i
      if record.alcoholuser.gender == 1
        if alcscore.maleco.blank?
          alcscore.maleco = 1
        else
          alcscore.maleco += 1
        end
      elsif record.alcoholuser.gender == 2
        if alcscore.femaleco.blank?
          alcscore.femaleco = 1
        else
          alcscore.femaleco += 1
        end
      end
      alcscore.save
    end
  end
  #
  # def initScore(score)
  #   if score.blank?
  #     score = 1
  #   else
  #     score +=1
  #   end
  # end

end
