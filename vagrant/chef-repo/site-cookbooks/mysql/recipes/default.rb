#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install mariadb
package_list = %w{
                mariadb
                mariadb-server
                }

package_list.each do |pkg|
  package "#{pkg}" do
    action :install
     options "--enablerepo=remi,epel"
  end
end

service "mariadb" do
  supports :start => true, :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

# 2回目以降エラーになるので注意
bash "timezone" do
  user "root"
  code <<-EOH
mysql_tzinfo_to_sql /usr/share/zoneinfo/Asia/Tokyo Asia/Tokyo | mysql -u root mysql
  EOH
end

template "/etc/my.cnf" do
  source "etc/my.cnf.erb"
  owner node["common"]["root_user"]
  group node["common"]["root_group"]
  mode 0644
  notifies :restart, "service[mariadb]"
end
