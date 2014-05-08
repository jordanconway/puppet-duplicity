# == Class: duplicity::profile
#
# Configure a backup profile.
#
# === Parameters
#
# [*ensure*]
#   Set state the profile should be in. Either present or absent.
#
# [*encryption_keys*]
#   List of public keys used to encrypt the backup.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2014 Martin Meinhold, unless otherwise noted.
#
define duplicity::profile(
  $ensure          = present,
  $encryption_keys = []
) {
  require duplicity::params

  if $ensure !~ /^present|absent$/ {
    fail("Duplicity::Profile[${title}]: ensure must be either present or absent, got '${ensure}'")
  }

  if !is_array($encryption_keys) {
    fail("Duplicity::Profile[${title}]: encryption_keys must be an array, got '${encryption_keys}'")
  }

  $profile_config_dir = "${duplicity::params::duply_config_dir}/${name}"
  $profile_config_dir_ensure = $ensure ? {
    absent  => absent,
    default => directory,
  }
  $profile_config_file = "${profile_config_dir}/conf"
  $profile_config_file_ensure = $ensure ? {
    absent  => absent,
    default => file,
  }
  $profile_file_list_file = "${profile_config_dir}/exclude"
  $profile_file_list_file_ensure = $ensure ? {
    absent  => absent,
    default => file,
  }

  file { $profile_config_dir:
    ensure => $profile_config_dir_ensure,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file { $profile_config_file:
    ensure  => $profile_config_file_ensure,
    content => template('duplicity/etc/duply/conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
  }

  file { $profile_file_list_file:
    ensure  => $profile_file_list_file_ensure,
    content => template('duplicity/etc/duply/exclude.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
  }
}
