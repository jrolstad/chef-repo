current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jrolstad"
client_key               "#{current_dir}/jrolstad.pem"
validation_client_name   "rolstad-validator"
validation_key           "#{current_dir}/rolstad-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/rolstad"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
