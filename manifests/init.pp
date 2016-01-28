#
class systemctl(
  $purge             = $::systemctl::params::purge,
  $unit_dir          = $::systemctl::unit_dir,
  $default_wanted_by = $::systemctl::default_wanted_by,
  $units             = {},
) inherits systemctl::params {
  validate_bool($purge)
  validate_absolute_path($unit_dir)
  validate_re($default_wanted_by, '\.target$')
  validate_hash($units)

  if $purge {
    file { $unit_dir:
      ensure  => directory,
      purge   => true,
      recurse => true,
    }
  }

  exec { 'systemctl daemon-reload':
    refreshonly => true,
    path        => '/bin:/sbin:/usr/bin:/usr/sbin';
  }

  create_resources('systemctl::unit', $units)
}