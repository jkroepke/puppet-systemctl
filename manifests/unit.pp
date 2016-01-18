class systemctl::unit(
  $ensure                           = 'present',
  $unit                             = $name,
  $type                             = 'service',
  $service_manage                   = true,
  $service_enable                   = true,
  $service_ensure                   = 'running',

  # automount
  $where                            = undef,
  $directory_mode                   = undef,
  $timeout_idle_sec                 = undef,

  # swap
  $unit                             = $name,
  $what                             = undef,
  $priority                         = undef,
  $options                          = undef,
  $timeout_sec                      = undef,

  # service
  $app_armor_profile                = undef,
  $bus_name                         = undef,
  $bus_policy                       = undef,
  $capabilities                     = undef,
  $capability_bounding_set          = undef,
  $cpu_affinity                     = undef,
  $cpu_scheduling_policy            = undef,
  $cpu_scheduling_priority          = undef,
  $cpu_scheduling_reset_on_fork     = undef,
  $environment                      = undef,
  $environment_file                 = undef,
  $exec_reload                      = undef,
  $exec_start                       = undef,
  $exec_start_post                  = undef,
  $exec_start_pre                   = undef,
  $exec_stop                        = undef,
  $exec_stop_post                   = undef,
  $failure_action                   = undef,
  $file_descriptor_store_max        = undef,
  $group                            = undef,
  $guess_main_pid                   = undef,
  $ignore_sigpipe                   = undef,
  $inaccessible_directories         = undef,
  $io_scheduling_class              = undef,
  $io_scheduling_priority           = undef,
  $limit_as                         = undef,
  $limit_core                       = undef,
  $limit_cpu                        = undef,
  $limit_data                       = undef,
  $limit_fsize                      = undef,
  $limit_locks                      = undef,
  $limit_memlock                    = undef,
  $limit_msgqueue                   = undef,
  $limit_nice                       = undef,
  $limit_nofile                     = undef,
  $limit_nproc                      = undef,
  $limit_rss                        = undef,
  $limit_rtprio                     = undef,
  $limit_rttime                     = undef,
  $limit_sigpending                 = undef,
  $limit_stack                      = undef,
  $mount_flags                      = undef,
  $nice                             = undef,
  $non_blocking                     = undef,
  $no_new_privileges                = undef,
  $notify_access                    = undef,
  $oom_score_adjust                 = undef,
  $pam_name                         = undef,
  $pass_environment                 = undef,
  $permissions_start_only           = undef,
  $personality                      = undef,
  $pid_file                         = undef,
  $private_devices                  = undef,
  $private_network                  = undef,
  $private_tmp                      = undef,
  $protect_home                     = undef,
  $protect_system                   = undef,
  $read_only_directories            = undef,
  $read_write_directories           = undef,
  $reboot_argument                  = undef,
  $remain_after_exit                = undef,
  $restart                          = undef,
  $restart_force_exit_status        = undef,
  $restart_prevent_exit_status      = undef,
  $restart_sec                      = undef,
  $restrict_address_families        = undef,
  $root_directory                   = undef,
  $root_directory_start_only        = undef,
  $runtime_directory                = undef,
  $runtime_directory_mode           = undef,
  $secure_bits                      = undef,
  $se_linux_context                 = undef,
  $smack_process_label              = undef,
  $sockets                          = undef,
  $standard_error                   = undef,
  $standard_input                   = undef,
  $standard_output                  = undef,
  $start_limit_action               = undef,
  $start_limit_burst                = undef,
  $start_limit_interval             = undef,
  $success_exit_status              = undef,
  $supplementary_groups             = undef,
  $syslog_facility                  = undef,
  $syslog_identifier                = undef,
  $syslog_level                     = undef,
  $syslog_level_prefix              = undef,
  $system_call_architectures        = undef,
  $system_call_error_number         = undef,
  $system_call_filter               = undef,
  $timeout_sec                      = undef,
  $timeout_start_sec                = undef,
  $timeout_stop_sec                 = undef,
  $timer_slack_nsec                 = undef,
  $tty_path                         = undef,
  $tty_reset                        = undef,
  $tty_v_hangup                     = undef,
  $tty_vt_disallocate               = undef,
  $type                             = undef,
  $umask                            = undef,
  $usb_function_descriptors         = undef,
  $usb_function_strings             = undef,
  $user                             = undef,
  $utmp_identifier                  = undef,
  $utmp_mode                        = undef,
  $watchdog_sec                     = undef,
  $working_directory                = undef,


  # unit
  $after                            = undef,
  $allow_isolate                    = undef,
  $assert_acpower                   = undef,
  $assert_architecture              = undef,
  $assert_capability                = undef,
  $assert_directory_not_empty       = undef,
  $assert_file_is_executable        = undef,
  $assert_file_not_empty            = undef,
  $assert_first_boot                = undef,
  $assert_host                      = undef,
  $assert_kernel_command_line       = undef,
  $assert_needs_update              = undef,
  $assert_path_exists               = undef,
  $assert_path_exists_glob          = undef,
  $assert_path_is_directory         = undef,
  $assert_path_is_mount_point       = undef,
  $assert_path_is_read_write        = undef,
  $assert_path_is_symbolic_link     = undef,
  $assert_security                  = undef,
  $assert_virtualization            = undef,
  $before                           = undef,
  $binds_to                         = undef,
  $condition_acpower                = undef,
  $condition_architecture           = undef,
  $condition_capability             = undef,
  $condition_directory_not_empty    = undef,
  $condition_file_is_executable     = undef,
  $condition_file_not_empty         = undef,
  $condition_first_boot             = undef,
  $condition_host                   = undef,
  $condition_kernel_command_line    = undef,
  $condition_needs_update           = undef,
  $condition_path_exists            = undef,
  $condition_path_exists_glob       = undef,
  $condition_path_is_directory      = undef,
  $condition_path_is_mount_point    = undef,
  $condition_path_is_read_write     = undef,
  $condition_path_is_symbolic_link  = undef,
  $condition_security               = undef,
  $condition_virtualization         = undef,
  $conflicts                        = undef,
  $default_dependencies             = undef,
  $description                      = undef,
  $documentation                    = undef,
  $ignore_on_isolate                = undef,
  $job_timeout_action               = undef,
  $job_timeout_reboot_argument      = undef,
  $job_timeout_sec                  = undef,
  $joins_namespace_of               = undef,
  $on_failure                       = undef,
  $on_failure_job_mode              = undef,
  $part_of                          = undef,
  $propagates_reload_to             = undef,
  $refuse_manual_start              = undef,
  $refuse_manual_stop               = undef,
  $reload_propagated_from           = undef,
  $requires                         = undef,
  $requires_mounts_for              = undef,
  $requisite                        = undef,
  $stop_when_unneeded               = undef,
  $wants                            = undef,

  # install
  $alias                            = undef,
  $also                             = undef,
  $default_instance                 = undef,
  $required_by                      = undef,
  $wanted_by                        = $::systemctl::default_wanted_by,
) {
  include systemctl

  validate_re($ensure, '^(present|absent)$',
    "${ensure} is not supported for ensure. Allowed values are 'present' and 'absent'.")

  validate_re($type, '^(service|swap|automount)$',
    "${type} is not supported for type. Supported type are 'service', 'swap' and 'automount'.")

  Concat::Fragment {
    target => "${::systemctl::unit_dir}/${unit}.${type}"
  }

  concat { "${::systemctl::unit_dir}/${unit}.${type}":
    ensure => $ensure,
    notify => Exec['systemctl daemon-reload'];
  }

  concat::fragment { "unit_${unit}.${type}":
    content => template('systemctl/unit.erb'),
    order   => '01';
  }

  concat::fragment { "automount_${unit}.${type}":
    content => template("systemctl/${type}.erb"),
    order   => '02';
  }

  concat::fragment { "install_${unit}.${type}":
    content => template('systemctl/automount.erb'),
    order   => '03';
  }

  if $service_manage {
    $depends = [Concat["${::systemctl::unit_dir}/${unit}.${type}"], Exec['systemctl daemon-reload']]

    service { "${unit}.${type}":
      ensure   => $ensure,
      enable   => $enable,
      before   => $ensure ? {
        absent  => $depends,
        default => undef,
      },
      require  => $ensure ? {
        absent  => undef,
        default => $depends,
      },
      provider => 'systemd';
    }
  }
}