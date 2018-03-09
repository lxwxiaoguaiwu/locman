class Api::V1::PassesController < Api::V1::BaseController
  before_action :authenticate_user!
  def create
    @pass = Pass.new
    @pass.user_id = params[:userid]
    @pass.xiaoqu_id = params[:xiaoquid]
    @pass.title = params[:title]
    @pass.leixing = params[:leixing]
    @pass.desc = params[:desc]
    @pass.asset = params[:asset]
    @pass.save
    nullornot(@pass.reload)
  end

  def index
    if params[:xiaoquid]
      @passes = Pass.where(xiaoqu_id: params[:xiaoquid]).order(created_at: :DESC).page params[:page]
    elsif params[:userid]
      @passes = Pass.where(user_id: params[:userid]).order(created_at: :DESC).page params[:page]
    else
      @passes = Pass.all.order(:created_at).order(created_at: :DESC).page params[:page]
    end
    zerornot(@passes)
  end

  def show
    if params[:id]
      @pass = Pass.find(params[:id])
      @users = @pass.users
      puts "user.length = #{@users.length}-------------"
      nullornot(@pass.reload)
    end
  end

  # def destroy
  #   pass = Pass.find(params[:id])
  #   pass.destroy
  #   if pass.frozen?
  #     @code = 10002
  #     @message = "删除成功！"
  #   else
  #     @code = 10001
  #     @message = "删除失败！"
  #   end
  # end

end
