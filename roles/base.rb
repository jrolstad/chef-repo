name "base"
description "Base Server Role"
run_list "recipe[hosts]","recipe[users]"
