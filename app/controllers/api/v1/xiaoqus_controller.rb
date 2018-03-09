class Api::V1::XiaoqusController < Api::V1::BaseController
  def index
    @shangqus = Shangquan.all
    if @shangqus
      @xiaoqus = Hash.new
      @shangqus.each do |s|
        @xiaoqus[s] = Xiaoqu.where(shangquan_id: s.id)
      end
    end
  end

  def show
    @xiaoqus = Xiaoqu.where(shangquan_id: params[:id])
  end

end
