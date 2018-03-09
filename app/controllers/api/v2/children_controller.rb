class Api::V2::ChildrenController < Api::V2::BaseController


  def create
    @child = Child.new
    @child.name = params[:name]
    @child.gender = params[:gender]
    @child.birthday = params[:birthday]
    @child.avatar = params[:avatar]
    @child.contact = params[:contact]
    @child.conphone = params[:conphone]
    @child.desc = params[:desc]
    @child.starttime = Date.today
    month = params[:month].to_i
    # TODO：生成检查周期记录
    createSercycle(month)
    @child.endtime = Date.today + month.months
    @child.save
    saveornot(@child.reload)
  end




  #1.显示孩子详情
  def show
    child = Child.find(params[:id])
  end

  #获取小孩的生长发育报告
  def lapreport
    #获取prams：小孩的id
    #获取params: 周期code  android端周期code计算公式:每2周（14天）评测一次，4周（28天）一个周期
    #根据参数获取小孩该周期的所有报告数据
  end

  #获取小孩的健康成长发育曲线
  def healthreport
    #获取prams：小孩的id
    #获取params: 周期code  android端周期code计算公式:每2周（14天）评测一次，4周（28天）一个周期
    #根据参数获取小孩该周期的所有原始数据，在Android端绘制曲线
  end

  def delete

  end

  def index
    @children = Child.all.order(created_at: :DESC)
    zerornot(@children)
  end

# 日期计算
  # Date.today + n.seconds # you can use 1.second
  # Date.today + n.minutes # you can use 1.minute
  # Date.today + n.hours # you can use 1.hour
  # Date.today + n.days # you can use 1.day
  # Date.today + n.weeks # you can use 1.week
  # Date.today + n.months # you can use 1.month
  # Date.today + n.years # you can use 1.year


  private
    def createSercycle(month)

    end


end
