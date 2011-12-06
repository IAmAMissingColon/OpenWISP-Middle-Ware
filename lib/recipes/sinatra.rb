# This file is part of the OpenWISP MiddleWare
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
