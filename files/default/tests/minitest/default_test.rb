require File.expand_path('../support/helpers', __FILE__)

describe 'tomcat7::default' do

  include Helpers::Tomcat7

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'make sure the tomcat user exists' do
	user("tomcat").must_exist
  end

  it 'make sure that /etc/init.d/tomcat7 exists' do
    file('/etc/init.d/tomcat7').must_exist
  end

  it 'make sure that /opt/tomcat/conf/server.xml exists' do
    file('/opt/tomcat/conf/server.xml').must_exist
  end

end
