define groups::setup($hash) {
  if(!defined(Group[$name])) {
    group { $name :
      ensure               => $hash[$name]['ensure'],
      allowdupe            => $hash[$name]['allowdupe'],
      attribute_membership => $hash[$name]['attribute_membership'],
      attributes           => $hash[$name]['attributes'],
      auth_membership      => $hash[$name]['auth_membership'],
      forcelocal           => $hash[$name]['forcelocal'],
      gid                  => $hash[$name]['gid'],
      ia_load_module       => $hash[$name]['ia_load_module'],
      members              => $hash[$name]['members'],
      provider             => $hash[$name]['provider'],
      system               => $hash[$name]['system'],
      alias                => $hash[$name]['alias'],
      audit                => $hash[$name]['audit'],
      before               => $hash[$name]['before'],
      loglevel             => $hash[$name]['loglevel'],
      noop                 => $hash[$name]['noop'],
      notify               => $hash[$name]['notify'],
      require              => $hash[$name]['require'],
      schedule             => $hash[$name]['schedule'],
      subscribe            => $hash[$name]['subscribe'],
      tag                  => $hash[$name]['tag'],
    }
  }
}
