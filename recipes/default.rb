#
# Cookbook Name:: tomcat7
# Recipe:: default
#
# Copyright (C) 2013 GINA
# 
# Cookbook Name:: tomcat7
# Attributes:: default

node.default['users'] = ["tomcat"]
include_recipe "user::data_bag"


case node['platform_family']
when "rhel", "fedora"
  node.override['java']['jdk_version'] = '7'
  node.override['java']['java_home'] = "/usr/lib/jvm/java"
  node.override['java']['openjdk_packages'] = ["java-1.#{node['java']['jdk_version']}.0-openjdk", "java-1.#{node['java']['jdk_version']}.0-openjdk-devel"]
end

include_recipe "java"

ark "apache-tomcat-#{node['tomcat7']['version']}" do
  url "http://archive.apache.org/dist/tomcat/tomcat-#{node['tomcat7']['base_version']}/v#{node['tomcat7']['version']}/bin/apache-tomcat-#{node['tomcat7']['version']}.tar.gz"
  checksum = node['tomcat7']['checksum']
  path node['tomcat7']['target']
  owner node['tomcat7']['user']
  group node['tomcat7']['group']
  action :put
end

link "#{node['tomcat7']['target']}/tomcat" do
  to "apache-tomcat-#{node['tomcat7']['version']}"
link_type :symbolic
end

directory "apache-tomcat-#{node['tomcat7']['version']}" do
  owner node['tomcat7']['user']
  group node['tomcat7']['group']
  recursive true
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
  action [:enable, :start]
end
