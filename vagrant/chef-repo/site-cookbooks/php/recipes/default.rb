#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package_list = %w{
                php
                php-devel
                php-mbstring
                php-opcache
                php-pear
                php-pecl-memcache
                php-pecl-oauth
                php-mysql
                php-mysqlnd
                php-pecl-imagick
                php-pdo
                php-pear-Net-UserAgent-Detect
                php-mcrypt
                php-pear-Net-IPv4
                php-pecl-apcu
				php-intl
                }
package_list.each do |pkg|
  package "#{pkg}" do
    action :install
     options "--enablerepo=remi,remi-php56,epel"
  end
end


%w{
  /etc/php.ini
  /etc/php.d/ming.ini
  /etc/php.d/apc.ini
}.each do |file|
  template "#{file}" do
    source file.sub(/^\//, '') + ".erb"
    owner node["common"]["root_user"]
    group node["common"]["root_group"]
    mode 0644
  end
end

template "/var/log/php.log" do
  source "var/log/php.log.erb"
  owner node["apache"]["User"]
  group node["apache"]["Group"]
  mode 0666
  not_if "test -f /var/log/php.log"
end
