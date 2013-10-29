#
# Cookbook Name:: tomcat7
# Recipe:: default
#
# Copyright (C) 2013 GINA
# 
# Cookbook Name:: tomcat7
# Attributes:: default

ark "apache-tomcat-#{node['tomcat7']['version']}" do
  url "http://archive.apache.org/dist/tomcat/tomcat-#{node['tomcat7']['base_version']}/v#{node['tomcat7']['version']}/bin/apache-tomcat-#{node['tomcat7']['version']}.tar.gz"
  checksum = node['tomcat7']['checksum']
  path node['tomcat7']['target']
  owner node['tomcat7']['user']
  action :put
end

link "#{node['tomcat7']['target']}/tomcat" do
  to "apache-tomcat-#{node['tomcat7']['version']}"
link_type :symbolic
end

template "/etc/init.d/tomcat7" do
  source "init-rh.erb"
  owner "root"
  group "root"
  mode "0775"
end

template "#{node['tomcat7']['target']}/tomcat/conf/server.xml" do
    source "server.xml.erb"
    owner node['tomcat7']['user']
    group node['tomcat7']['group']
    mode "0644"
end

service "tomcat7" do
  service_name "tomcat7"
  action :enable 
  action :start
end
