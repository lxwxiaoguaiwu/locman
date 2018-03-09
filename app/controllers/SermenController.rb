class SermenController < ApplicationController
  def serman_params
    params.require(:serman).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end
