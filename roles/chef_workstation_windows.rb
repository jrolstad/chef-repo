name "chef_workstation_windows"
description "Chef workstation on a windows machine"
run_list "recipe[powershell]", "recipe[chocolatey]"
