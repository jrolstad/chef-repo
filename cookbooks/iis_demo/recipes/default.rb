powershell_script "Install IIS" do
  action:run
  code "add-windowsfeature Web-Server"
end

service "w3svc" do
  action [:enable, :start]
end

cookbook_file 'c:\inetpub\wwwroot\default.htm' do
  source node["iis_demo"]["indexfile"]
  rights :read, "Everyone"
end
