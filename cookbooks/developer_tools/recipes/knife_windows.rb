 include_recipe 'gem_installer'

 override_attributes(
    :gem_installer => {
      :gems => {
        'knife-windows' => nil
      }
    }
  )
