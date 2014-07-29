#
# Cookbook Name:: validator_delete
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "delete validation.pem" do
  command "del c:\\chef\\validation.pem"
  only_if { ::File.exists?("c:\\chef\\validation.pem")}
end
