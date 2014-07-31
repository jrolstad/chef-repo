powershell_script "Install IIS" do
  code "add-windowsfeature Web-Server"
  action :run
end

service "w3svc" do
  action [:enable, :start ]
end

powershell_script "disable default site" do
    code 'get-website "Default Web Site*" | where {$_.state -ne "Stopped"} | Stop-Website'
end

node['iis_demo']['sites'].each do |site_name, site_data|
    site_dir = "#{ENV['SYSTEMDRIVE']}\\inetpub\\wwwroot\\#{site_name}"
    directory site_dir

    powershell_script "create app pool for #{site_name}" do
        code "New-WebAppPool #{site_name}"
        not_if "C:\\Windows\\System32\\inetsrv\\appcmd.exe list apppool #{site_name}"
    end

    powershell_script "new website for #{site_name}" do
        code <<-EOH
            Import-Module webadministration

            if((test-path IIS:\\Sites\\#{site_name}))
            {
                Remove-Website -name #{site_name}
            }

            New-WebSite -name #{site_name} -Port #{site_data['port']} -PhysicalPath #{site_dir} -ApplicationPool #{site_name}

        EOH
    end

    template "#{site_dir}\\default.htm" do
        source "default.htm.erb"
        rights :read, "Everyone"
        variables(
            :site_name => site_name,
            :port => site_data['port']
            )
        notifies :restart, "service[w3svc]"
    end
end
