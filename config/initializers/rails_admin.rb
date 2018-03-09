require Rails.root.join('lib/rails_admin/extensions/cancancan2/authorization_adapter')

RailsAdmin.config do |config|
  config.main_app_name = ["认识邻居","后台管理"]

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  #config.authorize_with :cancan
  config.authorize_with :cancancan2, AdminAbility

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
    config.model Tag do
      navigation_label '标签管理'
    end

    config.model Tagging do
      navigation_label '标签管理'
    end

    config.model Lapreport do
      navigation_label '成长发育评估'
    end

    config.model Lapresult do
      navigation_label '成长发育评估'
    end

    config.model Lap do
      navigation_label '成长发育评估'
    end

    config.model Teacher do
      navigation_label '用户管理'
    end

    config.model Child do
      navigation_label '用户管理'
    end

    config.model Equipment do
      navigation_label '用户管理'
    end

    config.model Sercycle do
      navigation_label '用户管理'
    end

    config.model Childimg do
      navigation_label '多媒体记录'
    end

    config.model Childlap do
      navigation_label '多媒体记录'
    end

    config.model Growthcurve do
      navigation_label '儿童健康评估'
    end

    config.model Checkup do
      navigation_label '儿童健康评估'
    end


    config.model Postimg do
      navigation_label '图片管理'
    end

    config.model Weixinimg do
      navigation_label '图片管理'
    end

    config.model Passimg do
      navigation_label '图片管理'
    end

    config.model Gradgood do
      navigation_label '酒水管理'
    end

    config.model Alcrecord do
      navigation_label '评价管理'
    end

    config.model Alcscore do
      navigation_label '评价管理'
    end

    config.model Webgood do
      navigation_label '酒水管理'
    end

    config.model Category do
      navigation_label '酒水管理'
    end

    config.model Alcohol do
      navigation_label '酒水管理'
    end

    config.model Imgcategory do
      navigation_label '酒水管理'
    end

    config.model Gradorder do
      navigation_label '订单管理'
    end

    config.model Weborder do
      navigation_label '订单管理'
    end

    config.model Orderitem do
      navigation_label '订单管理'
    end

    config.model Gradevin do
      navigation_label '酒柜管理'
    end

    config.model Alcoaddress do
      navigation_label '地址管理'
    end

    config.model Alcoholuser do
      navigation_label '用户管理'
    end

    config.model Serman do
    end
    config.model User do
    end


    config.authenticate_with do
   warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)
  end
end
