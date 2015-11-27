#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
  options "--enablerepo=remi,epel"
end

### Apache Conf
%w{
  /etc/httpd/conf.d/virtualhost.conf
}.each do |file|
  template "#{file}" do
    source file.sub(/^\//, '') + ".erb"
    owner node["common"]["root_user"]
    group node["common"]["root_group"]
    mode 0644
  end
end

### Apache Log
directory "/var/log/httpd" do
  owner node["common"]["root_user"]
  group node["common"]["root_group"]
  mode 0755
  action :create
end

### Service Operation
service "httpd" do
  supports :start => true, :restart => true, :status => true, :reload => true
  action [:enable, :start]
end
