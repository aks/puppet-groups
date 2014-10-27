node default {

  notify { 'enduser-before': }
  notify { 'enduser-after': }

  include groups
}
