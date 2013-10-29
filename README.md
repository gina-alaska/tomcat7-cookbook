# tomcat7 cookbook
vagrant testing currently not working...
I've had to create /etc/chef/solo.rb and /etc/chef/solo.json and then run chef-client manually

[root@tomcat7-berkshelf ~]# cat /etc/chef/solo.rb 
```file_cache_path    "/var/chef/cache"
file_backup_path   "/var/chef/backup"
cookbook_path ["/tmp/vagrant-chef-1/chef-solo-1/cookbooks"]
log_level :info
verbose_logging    false
encrypted_data_bag_secret "/tmp/encrypted_data_bag_secret"
data_bag_path "/vagrant/files/default/tests/data_bags/"
http_proxy nil
http_proxy_user nil
http_proxy_pass nil
https_proxy nil
https_proxy_user nil
https_proxy_pass nil
no_proxy nil
```

[root@tomcat7-berkshelf ~]# cat /etc/chef/solo.json 
```{
  "users": ["tomcat"],
  "run_list": ["recipe[gina::users]", "recipe[java]", "recipe[tomcat7]", "recipe[minitest-handler::default]"]
}
```


# Requirements
centos, java, tomcat user
# Usage

# Attributes

# Recipes

# Author

Author:: Mark Morlino (<mark@gina.alaska.edu>)
