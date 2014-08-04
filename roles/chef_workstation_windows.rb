name "chef_workstation_windows"
description "Chef workstation on a windows machine"
run_list "recipe[powershell]", "recipe[chocolatey]", "recipe[msdotnet45]","recipe[developer_tools::git]","recipe[developer_tools::tortoise_git]","recipe[developer_tools::chocolatey]","recipe[developer_tools::atom]","recipe[developer_tools::google_chrome]","recipe[developer_tools::knife_windows]","recipe[developer_tools::knife_ec2]"
