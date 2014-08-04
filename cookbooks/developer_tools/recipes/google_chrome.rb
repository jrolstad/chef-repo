include_recipe 'chocolatey'

chocolatey "googlechrome" do
  action :install
end
