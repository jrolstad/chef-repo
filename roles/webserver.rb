name "webserver"
description "Web Server"
run_list "role[base]","recipe[iis_demo]"
default_attributes ({
  "iis_demo" =>{
    "sites"=>{
      "admin" => {
        "port"=>8000
        }
      }
    }
  })
