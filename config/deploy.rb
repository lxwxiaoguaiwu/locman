require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'locman'
set :domain, '139.129.233.170'
set :deploy_to, '/var/www/api.changching.cn'
set :repository, 'git@gitlab.hf66.net:changching/locman.git'
set :branch, 'master'
#set :term_mode, :nil #解决输入密码后按回车没反应
# Optional settings:
set :user, 'developer'          # Username in the server to SSH to.
#   set :port, '30000'           # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.
#set :rvm_path, '/usr/local/rvm/bin/rvm'

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
set :shared_dirs, fetch(:shared_dirs, []).push('log','public/system')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')
#set :shared_paths, ['config/database.yml', 'config/secrets.yml', 'log']
#set :shared_paths, '#{fetch(:deploy_to)}/shared'

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'
  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', 'ruby-2.4.2@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  comment "Setup #{fetch(:deploy_to)}/shared/config"

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"]
  command %[touch "#{fetch(:deploy_to)}/shared/config/database.yml"]
  command %[touch "#{fetch(:deploy_to)}/shared/config/secrets.yml"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/sockets"]
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/pids"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/sockets"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/pids"]

end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # rails assets:precompile RAILS_ENV=production
    comment "Deploying #{fetch(:rails_env)} #{fetch(:application_name)} to #{fetch(:domain)} : #{fetch(:deploy_to)} "
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'rvm:use', 'ruby-2.4.2@default'
    invoke :'bundle:install'
    invoke :'rails:db_create'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    #command %{#{fetch(:rails)} assets:precompile}
    #comment %{#{fetch(:rails)} assets:precompile}
    invoke :'deploy:cleanup'
    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end


# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
namespace :puma do
  set :web_server, :puma

  set :puma_role,      -> { user }
  set :puma_env,       -> { fetch(:rails_env, 'production') }
  set :puma_config,    -> { "/var/www/api.changching.cn/current/config/puma.rb" }
  set :puma_socket,    -> { "/var/www/api.changching.cn/shared/tmp/sockets/puma.sock" }
  set :puma_state,     -> { "/var/www/api.changching.cn/shared/tmp/sockets/puma.state" }
  set :puma_pid,       -> { "/var/www/api.changching.cn/shared/tmp/pids/puma.pid" }
  set :puma_cmd,       -> { "bundle exec puma" }
  set :pumactl_cmd,    -> { "pumactl" }
  set :pumactl_socket, -> { "/var/www/api.changching.cn/shared/tmp/sockets/pumactl.sock" }
  # Make necessary direcotries exist
  # task :setup => :environment do
  #   command "mkdir /var/www/api.changching.cn/shared/tmp/sockets/"
  #   command "mkdir /var/www/api.changching.cn/shared/tmp/pids/"
  # end

  desc 'Start puma'
  task :start => :environment do
    command 'echo "-----> Start Puma"'
    command %[
      if [ -e '#{fetch(:pumactl_socket)}' ]; then
        echo 'Puma is already running!';
      else
        if [ -e '#{fetch(:puma_config)}' ]; then
          echo '#{fetch(:puma_config)}'
          cd /var/www/api.changching.cn/current && #{fetch(:puma_cmd)} -q -d -e #{fetch(:puma_env)} -b 'unix://#{fetch(:puma_socket)}' -S #{fetch(:puma_state)} --control 'unix://#{fetch(:pumactl_socket)}'

          echo '#{fetch(:puma_cmd)} -q -d -e #{fetch(:puma_env)} -C #{fetch(:puma_config)}'
        else
          cd /var/www/api.changching.cn/current && #{fetch(:puma_cmd)} -q -d -e #{fetch(:puma_env)} -b 'unix://#{fetch(:puma_socket)}' -S #{fetch(:puma_state)} --control 'unix://#{fetch(:pumactl_socket)}'
          echo ' #{fetch(:puma_cmd)} -q -d -e #{fetch(:puma_env)} -b 'unix://#{fetch(:puma_socket)}' -S #{fetch(:puma_state)} --control 'unix://#{fetch(:pumactl_socket)}''
        fi
      fi
    ]
  end

  desc 'Stop puma'
  task stop: :environment do
    command %[
      if [ -e '#{fetch(:pumactl_socket)}' ]; then
        cd /var/www/api.changching.cn/current  && #{fetch(:pumactl_cmd)} -S #{fetch(:puma_state)} stop
        cd /var/www/api.changching.cn/shared/tmp/sockets/ && rm puma.sock puma.state pumactl.sock
      else
        echo 'Puma is not running!';
      fi
    ]
  end

end
