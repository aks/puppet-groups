groups
====


Overview
--------

The groups module allows management of groups through hiera or a
hash of directly specified groups.

Module Description
-------------------

Normally each group needs to be specified inside a puppet manifest. This module
allows you to specify the groups outside of puppet, so that the group setup can
become variable.

Setup
-----

### Configure your groups in hiera

    common.yaml:

    ---
    groups_system:
        sudo:
            ensure: present
            system: true
        dev:
            ensure: present
        old:
            ensure: absent

The complete list of (group type parameters)[https://docs.puppetlabs.com/references/3.7.latest/type.html#group]:

    name                 => # (namevar) The group name. While naming limitations vary by 
    ensure               => # Create or remove the group.  Valid values are...
    allowdupe            => # Whether to allow duplicate GIDs. Defaults to...
    attribute_membership => # Whether specified attribute value pairs should...
    attributes           => # Specify group AIX attributes in an array of...
    auth_membership      => # whether the provider is authoritative for group...
    forcelocal           => # Forces the management of local accounts when...
    gid                  => # The group ID.  Must be specified numerically....
    ia_load_module       => # The name of the I&A module to use to manage this 
    members              => # The members of the group. For directory services 
    provider             => # The specific backend to use for this `group...
    system               => # Whether the group is a system group with lower...


All parameters to the standard type `group` can be used.

### Include groups in your manifest

    site.pp:

    node /default/ {
        groups { system: }
    }

Usage
------

The name given to the groups type will be used to lookup `groups_$name` inside
hiera. Alternatively you can specify the hash directly without hiera, see
below.

The defined type `groups` can be called with two arguments:

###`match`

Defaults to `'all'`. Can be `'all'`, `'any'` (synonym for `'all'`), or `'first'`.

If `'first'` is used, then only the first match in your hiera hierarchy will be
used. If you specify `'all'` then all matching hashes will be be used. This
corresponds directly to the respective `hiera` and `hiera_hash` function calls.

###`hash`

Defaults to `undef`. Uses the given hash rather than the result of the `hiera` lookup.

Troubleshooting
---------------

Before blaming me, check if your hiera configuration is working correctly. For
instance, you can use this to check if puppet is seeing your hiera data
correctly:

    node /mynode/ {
      $mytest = hiera("groups_system", "not found")
      notify { "$mytest": }
    }


Dependencies
------------

* In puppet 3.0.0, `hiera` became a standard function call so it is included by
  default in your puppet installation. Before 3.0.0, you must install the
  `hiera-puppet` module.

* stdlib
