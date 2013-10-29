# Cookbook Name:: tomcat7
# Attributes:: default

default['tomcat7']['base_version'] = "7"
default['tomcat7']['version'] = "7.0.27"
default['tomcat7']['user'] = "tomcat"
default['tomcat7']['group'] = "tomcat"
default['tomcat7']['target'] = "/opt"
default['tomcat7']['port'] = 8080
default['tomcat7']['ssl_port'] = 8443
default['tomcat7']['ajp_port'] = 8009
default['tomcat7']['java_options'] = " -Xmx128M -Dajva.awt.headless=true"
default['tomcat7']['use_security_manager'] = "no"
default['tomcat7']['base_url'] = "http://archive.apache.org/dist/tomcat/tomcat-"
# http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.27/bin/apache-tomcat-7.0.27.tar.gz
# ark can't use a url for the checksum?
default['tomcat7']['checksum'] = "486769ec1094fb45f000d30f237b3643"

##
set['tomcat7']['home'] = "#{tomcat7['target']}/tomcat"
set['tomcat7']['base'] = "#{tomcat7['target']}/tomcat"
set['tomcat7']['config_dir'] = "#{tomcat7['target']}/tomcat/conf"
set['tomcat7']['log_dir'] = "#{tomcat7['target']}/tomcat/logs"
