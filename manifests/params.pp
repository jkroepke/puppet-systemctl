class systemctl::params {
  $purge             = false
  $unit_dir          = '/etc/systemd/system'
  $default_wanted_by = 'multi-user.target'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Ubuntu': {
          if versioncmp($::operatingsystemmajrelease, '14.10') <= 0 {
            fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
          }
        }
        'Debian': {
          if versioncmp($::operatingsystemmajrelease, '8') <= 0 {
            fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        'Fedora': {
          if versioncmp($::operatingsystemmajrelease, '16') <= 0 {
            fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
          }
        }
        'CentOS', 'RedHat': {
          if versioncmp($::operatingsystemmajrelease, '7') <= 0 {
            fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    'ArchLinux': {

    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

  if $::service_provider != 'systemd' {
    fail("The ${module_name} module require systemd as service providor. Current service providor is ${::service_provider}.")
  }
}