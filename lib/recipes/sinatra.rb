# This file is part of the OpenWISP MiddleWare
#
# Copyright (C) 2011 CASPUR (wifi@caspur.it)
#
# This software is licensed under a Creative  Commons Attribution-NonCommercial
# 3.0 Unported License.
#   http://creativecommons.org/licenses/by-nc/3.0/
#
# Please refer to the  README.license  or contact the copyright holder (CASPUR)
# for licensing details.
#

namespace :sinatra do
  desc "Repair permissions to allow user to perform all actions"
  task :repair_permissions, :roles => :app do
    puts "Applying correct permissions to allow for proper command execution"
    try_sudo "mkdir -p #{shared_path}/log #{current_path}/tmp"
    try_sudo "chmod -R 770 #{shared_path}/log #{current_path}/tmp"
    try_sudo "chown -R www-data.www-data #{shared_path}/log #{current_path}/tmp"
  end

  desc "Displays the production log from the server locally"
  task :tail, :roles => :app do
    stream "tail -f #{shared_path}/log/sinatra.log"
  end
end
