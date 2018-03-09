class Api::V2::ChildlapsController < Api::V2::BaseController
  def show
    @childlap = Childlap.find(params[:id])
    lastid = Childimg.last.id
    if params[:lastid] != '-1'
      puts "params[:lastid] = #{params[:lastid]}---------------------"
      first = params[:lastid]
    else
      first = Childimg.first.id
    end
    if first
      puts "first = #{first}-----lastid #{lastid}--------------"
      @childimgs = Childimg.where(id: (first)..lastid).order(id: :DESC)
    end
  end

  def index
    # 1.获取当前时间，获取child对应时间的sercycleid,再获取所有的图片
    #     ['大运动', '精细运动', '认知行为', '语言行为','自理能力','社会情绪']
    #   ['GrossMotor', 'FineMotor', 'Congnitive', 'Language','SelfHelp','Social/Emotional']
    @gross = Childlap.where(child_id: params[:childid],leibie: "大运动").last(2)
    @fine = Childlap.where(child_id: params[:childid],leibie: "精细运动").last(2)
    @congnitive = Childlap.where(child_id: params[:childid],leibie: "认知行为").last(2)
    @language = Childlap.where(child_id: params[:childid],leibie: "语言行为").last(2)
    @selfhelp = Childlap.where(child_id: params[:childid],leibie: "自理能力").last(2)
    @social = Childlap.where(child_id: params[:childid],leibie: "社会情绪").last(2)
    zerornot(@gross) #TODO:根据sercyleid查看是否有这个周期的记录
  end

  def create
    # TODO：判断当前child同类型图片是否已经有两张
    @childlap = Childlap.new
    @childlap.desc = params[:desc]
    @childlap.child_id = params[:childid]
    @childlap.teacherid = params[:teacherid]
    @childlap.asset = params[:asset]
    @childlap.leibie = params[:leibie]
    child = Child.find(params[:childid])
    @childlap.sercycle_id = params[:sercycleid]
    @childlap.save
    saveornot(@childlap.reload)
  end
end
