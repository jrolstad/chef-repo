include_recipe 'chocolatey'

chocolatey "git" do
  action :install
end
