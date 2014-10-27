define groups(
  $match      = 'all',
  $hash       = undef
) {

  include stdlib

  case $match {
    'all','any': { $_match = 'all' }
    'first':     { $_match = 'first' }
  }

  if $hash {
    $_hash = $hash
  } else {
    # The use of 'all' and 'first' has this meaning: 'all' will
    # traverse the hierarchy and get all matches; 'first' will
    # only fetchthe first
    case $_match {
      'all': {
        $_hash = hiera_hash("groups_${name}", undef)
      }
      'first': {
        $_hash = hiera("groups_${name}", undef)
      }
    }
  }

  if $_hash {
    $groups = keys($_hash)
    groups::setup {
      $groups:
        hash       => $_hash;
    }
  } else {
    notify { "no data for resource '$name' title '$title'": }
  }
}
