#
# Cookbook Name:: virtualbox-guesttools
# Recipe:: default
#
# Copyright 2012, I Need a Robot.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

execute "sudo apt-get install dkms build-essential linux-headers-generic linux-headers-2.6.32-33-generic" do
  command "sudo apt-get install dkms build-essential linux-headers-generic linux-headers-2.6.32-33-generic"
end

execute " /etc/init.d/vboxadd setup" do
  command " /etc/init.d/vboxadd setup"
end