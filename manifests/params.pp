class systemctl::params {
  $purge             = false
  $unit_dir          = '/etc/systemd/system'
  $default_wanted_by = 'multi-user.target'

  if $::service_provider != 'systemd' {
    fail("The ${module_name} module require systemd as service providor. Current service providor is ${::service_provider}.")
  }
}