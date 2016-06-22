# Class: cron::install
#
# This class ensures that the distro-appropriate cron package is installed
#
# Parameters:
#   package_ensure - Can be set to a package version, 'latest', 'installed' or
#   'present'.
#     Default: installed
#
#   package_name - Can be used to install a different cron package.
#     Default: undef
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   This class should not be used directly under normal circumstances
#   Instead, use the *cron* class.
#
class cron::install (
  $package_ensure = 'installed',
  $package_name   = undef,
) {

<<<<<<< HEAD
  $package_name = $::operatingsystem ? {
    /(RedHat|CentOS|Amazon|OracleLinux|Scientific)/ => 'cronie',
    'Gentoo'                                        => 'sys-process/vixie-cron',
    'Ubuntu'                                        => 'cron',
    'Debian'                                        => 'cron',
    default                                         => 'cron',
=======
  if $package_name {
    $real_package_name = $package_name
  } else {
    case $::operatingsystem {
      /^(RedHat|CentOS|Amazon|OracleLinux)/: {
        if versioncmp($::operatingsystemmajrelease, '5') <= 0 {
          $real_package_name = 'vixie-cron'
        } else {
          $real_package_name = 'cronie'
        }
      }
      'Gentoo': {
        $real_package_name = 'virtual/cron'
      }
      'Ubuntu': {
        $real_package_name = 'cron'
      }
      'Debian': {
        $real_package_name = 'cron'
      }
      default: {
        $real_package_name = 'cron'
      }
    }
>>>>>>> refs/remotes/roman-mueller/master
  }

  package { 'cron':
    ensure => $package_ensure,
    name   => $real_package_name,
  }

}

