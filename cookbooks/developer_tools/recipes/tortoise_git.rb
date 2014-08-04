include_recipe 'chocolatey'

chocolatey "tortoisegit" do
  action :install
end
