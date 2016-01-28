# define: systemctl::unit
#
# This definition creates a systemd unit file
#
# Parameters:
#   [*ensure*]              - Create or delete the specified systemd unit
#     (present|absent)
# Actions:
#
# Requires:
#
# Sample Usage:
#  systemctl::unit { 'myapp':
#    ensure      => present,
#    description => 'My fancy application!',
#    exec_start  => '/usr/local/bin/myapp';
#  }


class systemctl::unit(
  $ensure                           = 'present',
  $unit                             = $name,
  $unit_type                        = 'service',
  $service_manage                   = true,
  $service_enable                   = true,
  $service_ensure                   = 'running',

  # automount
  $where                            = undef,
  $directory_mode                   = undef,
  $timeout_idle_sec                 = undef,

  # swap
  $what                             = undef,
  $priority                         = undef,
  $options                          = undef,
  $timeout_sec                      = undef,

  # service
  $app_armor_profile                = undef,
  $block_io_accounting              = undef,
  $block_io_device_weight           = [],
  $block_io_read_bandwidth          = [],
  $block_io_write_bandwidth         = [],
  $bus_name                         = undef,
  $bus_policy                       = undef,
  $capabilities                     = [],
  $capability_bounding_set          = [],
  $cpu_accounting                   = undef,
  $cpu_affinity                     = undef,
  $cpu_quota                        = undef,
  $cpu_scheduling_policy            = undef,
  $cpu_scheduling_priority          = undef,
  $cpu_scheduling_reset_on_fork     = undef,
  $cpu_shares                       = undef,
  $delegate                         = undef,
  $device_allow                     = [],
  $environment                      = [],
  $environment_file                 = [],
  $exec_reload                      = undef,
  $exec_start                       = undef,
  $exec_start_post                  = [],
  $exec_start_pre                   = [],
  $exec_stop                        = undef,
  $exec_stop_post                   = [],
  $exec_stop_pre                    = [],
  $failure_action                   = undef,
  $file_descriptor_store_max        = undef,
  $group                            = undef,
  $guess_main_pid                   = undef,
  $ignore_sigpipe                   = undef,
  $inaccessible_directories         = [],
  $io_scheduling_class              = undef,
  $io_scheduling_priority           = undef,
  $kill_mode                        = undef,
  $kill_signal                      = undef,
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
  $memory_accounting                = undef,
  $memory_limit                     = undef,
  $mount_flags                      = undef,
  $net_class                        = undef,
  $nice                             = undef,
  $non_blocking                     = undef,
  $no_new_privileges                = undef,
  $notify_access                    = undef,
  $oom_score_adjust                 = undef,
  $pam_name                         = undef,
  $pass_environment                 = [],
  $permissions_start_only           = undef,
  $personality                      = undef,
  $pid_file                         = undef,
  $private_devices                  = undef,
  $private_network                  = undef,
  $private_tmp                      = undef,
  $protect_home                     = undef,
  $protect_system                   = undef,
  $read_only_directories            = [],
  $read_write_directories           = [],
  $reboot_argument                  = undef,
  $remain_after_exit                = undef,
  $restart                          = undef,
  $restart_force_exit_status        = [],
  $restart_prevent_exit_status      = [],
  $restart_sec                      = undef,
  $restrict_address_families        = [],
  $root_directory                   = undef,
  $root_directory_start_only        = undef,
  $runtime_directory                = [],
  $runtime_directory_mode           = undef,
  $secure_bits                      = [],
  $se_linux_context                 = undef,
  $send_sighup                      = undef,
  $send_sigkill                     = undef,
  $slice                            = undef,
  $smack_process_label              = undef,
  $sockets                          = undef,
  $standard_error                   = undef,
  $standard_input                   = undef,
  $standard_output                  = undef,
  $start_limit_action               = undef,
  $start_limit_burst                = undef,
  $start_limit_interval             = undef,
  $startup_block_io_weight          = undef,
  $startup_cpu_shares               = undef,
  $success_exit_status              = [],
  $supplementary_groups             = [],
  $syslog_facility                  = undef,
  $syslog_identifier                = undef,
  $syslog_level                     = undef,
  $syslog_level_prefix              = undef,
  $system_call_architectures        = [],
  $system_call_error_number         = undef,
  $system_call_filter               = [],
  $tasks_accounting                 = undef,
  $tasks_max                        = undef,
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
  $after_unit                       = [],
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
  $before_unit                      = [],
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
  $conflicts                        = [],
  $default_dependencies             = undef,
  $description                      = undef,
  $documentation                    = undef,
  $ignore_on_isolate                = undef,
  $job_timeout_action               = undef,
  $job_timeout_reboot_argument      = undef,
  $job_timeout_sec                  = undef,
  $joins_namespace_of               = [],
  $on_failure                       = [],
  $on_failure_job_mode              = undef,
  $part_of                          = undef,
  $propagates_reload_to             = undef,
  $refuse_manual_start              = undef,
  $refuse_manual_stop               = undef,
  $reload_propagated_from           = [],
  $requires                         = [],
  $requires_mounts_for              = [],
  $requisite                        = undef,
  $stop_when_unneeded               = undef,
  $wants                            = undef,

  # install
  $alias_unit                       = undef,
  $also                             = undef,
  $default_instance                 = undef,
  $required_by                      = undef,
  $wanted_by                        = $::systemctl::default_wanted_by,
) {
  include systemctl

  validate_re($ensure, '^(present|absent)$', "${ensure} is not supported for ensure. Allowed values are 'present' and 'absent'.")

  validate_bool($service_manage)
  validate_bool($service_enable)
  validate_string($service_ensure)

  case $type {
    'automount': {
      # automount
      if ($where == undef) {
        fail('$where is required.')
      }

      validate_absolute_path($where)

      if ($directory_mode != undef) {
        validate_re($directory_mode, '^\d{4}$', '$directory_mode is not valid. It should be 4 digits.')
      }

      if ($timeout_idle_sec != undef) {
        validate_string($timeout_idle_sec)
      }
    }
    'swap': {
      if ($what == undef) {
        fail('$what is required.')
      }

      validate_absolute_path($what)

      if !is_integer($priority) {
        fail('$priority must be an integer.')
      }

      if ($options != undef) {
        validate_string($options)
      }

      if !is_integer($timeout_sec) {
        fail('$timeout_sec must be an integer.')
      }
    }
    'service': {
      if ($app_armor_profile != undef) {
        validate_string($app_armor_profile)
      }

      if ($block_io_accounting != undef) {
        validate_bool($block_io_accounting)
      }

      any2array($block_io_device_weight)
      any2array($block_io_read_bandwidth)

      if !is_integer($block_io_weight) {
        fail('$block_io_weight must be an integer.')
      }

      any2array($block_io_write_bandwidth)

      if ($bus_name != undef) {
        validate_string($bus_name)
      }

      if ($bus_policy != undef) {
        validate_string($bus_policy)
      }

      any2array($capabilities)
      any2array($capability_bounding_set)

      if ($cpu_accounting != undef) {
        validate_bool($cpu_accounting)
      }

      if ($cpu_affinity != undef) {
        validate_string($cpu_affinity)
      }

      if ($cpu_quota != undef) {
        validate_re($cpu_quota, '^\d+%$')
      }

      if ($cpu_scheduling_policy != undef) {
        validate_re($cpu_scheduling_policy, '^(other|batch|idle|fifo|rr)$')
      }

      if !is_integer($cpu_scheduling_priority) {
        fail('$cpu_scheduling_priority must be an integer.')
      }

      if ($cpu_scheduling_reset_on_fork != undef) {
        validate_bool($cpu_scheduling_reset_on_fork)
      }

      if !is_integer($cpu_shares) {
        fail('$cpu_shares must be an integer.')
      }

      if ($delegate != undef) {
        validate_bool($delegate)
      }

      any2array($device_allow)

      if ($device_policy != undef) {
        validate_re($device_policy, '^(auto|closed|strict)$')
      }

      any2array($environment)
      any2array($environment_file)

      if ($exec_reload != undef) {
        validate_string($exec_reload)
      }

      if ($exec_start != undef) {
        validate_string($exec_start)
      }

      any2array($exec_start_post)
      any2array($exec_start_pre)
      any2array($exec_stop_post)
      any2array($exec_stop_pre)

      if ($failure_action != undef) {
        validate_string($failure_action)
      }

      if !is_integer($file_descriptor_store_max) {
        fail('$file_descriptor_store_max must be an integer.')
      }

      if ($failure_action != undef) {
        validate_string($failure_action)
      }

      if ($group != undef) {
        validate_string($group)
      }

      if ($guess_main_pid != undef) {
        validate_bool($guess_main_pid)
      }

      if ($ignore_sigpipe != undef) {
        validate_bool($ignore_sigpipe)
      }

      #https://github.com/systemd/systemd/issues/854
      any2array($inaccessible_directories)

      if ($io_scheduling_class != undef) {
        validate_re($io_scheduling_class, '^(none|realtime|best\-effort|idle|[0-3])$')
      }

      if !is_integer($io_scheduling_priority) {
        fail('$io_scheduling_priority must be an integer.')
      }

      if ($kill_mode != undef) {
        validate_re($kill_mode, '^(control\-group|process|mixed|none)?$')
      }

      if ($kill_signal != undef) {
        validate_re($kill_signal, '^SIG')
      }

      if ($limit_as != undef) {
        validate_re($limit_as, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_core != undef) {
        validate_re($limit_core, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_data != undef) {
        validate_re($limit_data, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_memlock != undef) {
        validate_re($limit_memlock, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_msgqueue != undef) {
        validate_re($limit_msgqueue, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_rss != undef) {
        validate_re($limit_rss, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_rss != undef) {
        validate_re($limit_rss, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if ($limit_stack != undef) {
        validate_re($limit_stack, '^[0-9]+(K|M|G|T|P|E)?$')
      }

      if !is_integer($limit_cpu) {
        fail('$limit_cpu must be an integer.')
      }

      if !is_integer($limit_locks) {
        fail('$limit_locks must be an integer.')
      }

      if !is_integer($limit_nice) {
        fail('$limit_nice must be an integer.')
      }

      if !is_integer($limit_nofile) {
        fail('$limit_nofile must be an integer.')
      }

      if !is_integer($limit_nproc) {
        fail('$limit_nproc must be an integer.')
      }

      if !is_integer($limit_rtprio) {
        fail('$limit_nproc must be an integer.')
      }

      if !is_integer($limit_sigpending) {
        fail('$limit_nproc must be an integer.')
      }

      if ($memory_accounting != undef) {
        validate_bool($memory_accounting)
      }

      if !is_integer($memory_limit) {
        fail('$memory_limit must be an integer.')
      }

      if ($mount_flags != undef) {
        validate_string($mount_flags)
      }

      if !is_integer($net_class) {
        fail('$net_class must be an integer.')
      }

      if !is_integer($nice) {
        fail('$nice must be an integer.')
      }

      if ($non_blocking != undef) {
        validate_bool($non_blocking)
      }

      if ($no_new_privileges != undef) {
        validate_bool($no_new_privileges)
      }

      if ($notify_access != undef) {
        validate_re($notify_access, '^(none|main|all)$')
      }

      if !is_integer($oom_score_adjust) {
        fail('$oom_score_adjust must be an integer.')
      }

      if ($pam_name != undef) {
        validate_string($pam_name)

      }

      any2array($pass_environment)

      if ($permissions_start_only != undef) {
        validate_bool($permissions_start_only)
      }

      if ($personality != undef) {
        validate_re($personality, '^(x86|x86\-64)$')
      }

      if ($pid_file != undef) {
        validate_absolute_path($pid_file)
      }

      if ($private_devices != undef) {
        validate_bool($private_devices)
      }

      if ($private_network != undef) {
        validate_bool($private_network)
      }

      if ($private_tmp != undef) {
        validate_bool($private_tmp)
      }

      if ($protect_home != undef) {
        validate_bool($protect_home)
      }

      if ($protect_system != undef) {
        validate_bool($protect_system)

      }

      any2array($read_only_directories)
      any2array($read_write_directories)

      if ($reboot_argument != undef) {
        validate_string($reboot_argument)
      }

      if ($remain_after_exit != undef) {
        validate_bool($remain_after_exit)
      }

      if ($restart != undef) {
        validate_re($restart, '^(no|on\-(success|failure|abnormal|watchdog|abort)|always)$')
      }

      any2array($restart_force_exit_status)
      any2array($restart_prevent_exit_status)

      if !is_integer($restart_sec) {
        fail('$restart_sec must be an integer.')
      }

      any2array($restrict_address_families)

      if ($root_directory != undef) {
        validate_absolute_path($root_directory)
      }

      if ($root_directory_start_only != undef) {
        validate_bool($root_directory_start_only)
      }
      any2array($runtime_directory)

      if ($runtime_directory_mode != undef) {
        validate_re($runtime_directory_mode, '^\d{4}$', '$runtime_directory_mode is not valid. It should be 4 digits.')
      }

      any2array($secure_bits)

      if ($se_linux_context != undef) {
        validate_string($se_linux_context)
      }

      if ($send_sighup != undef) {
        validate_bool($send_sighup)
      }

      if ($send_sigkill != undef) {
        validate_bool($send_sigkill)
      }

      if ($slice != undef) {
        validate_string($slice)
      }

      if ($smack_process_label != undef) {
        validate_string($smack_process_label)
      }

      if ($sockets != undef) {
        validate_string($sockets)
      }

      if ($standard_error != undef) {
        validate_re($standard_error, '^(inherit|null|tty|journal|syslog|kmsg|journal\+console|syslog\+console|kmsg\+console|socket)$')
      }

      if ($standard_input != undef) {
        validate_re($standard_input, '^(inherit|null|tty|tty\-force|tty\-fail|socket)$')
      }

      if ($standard_output != undef) {
        validate_re($standard_output, '^(inherit|null|tty|journal|syslog|kmsg|journal\+console|syslog\+console|kmsg\+console|socket)$')
      }

      if ($start_limit_action != undef) {
        validate_re($start_limit_action, '^(none|reboot|reboot\-force|reboot\-immediate|poweroff|poweroff\-force|poweroff\-immediate)$')
      }

      if !is_integer($start_limit_burst) {
        fail('$start_limit_burst must be an integer.')
      }

      if !is_integer($start_limit_interval) {
        fail('$start_limit_interval must be an integer.')
      }

      if !is_integer($startup_block_io_weight) {
        fail('$startup_block_io_weight must be an integer.')
      }

      if !is_integer($startup_cpu_shares) {
        fail('$startup_cpu_shares must be an integer.')
      }

      any2array($success_exit_status)
      any2array($supplementary_groups)

      if ($supplementary_groups != undef) {
        validate_string($supplementary_groups)
      }

      if ($syslog_facility != undef) {
        validate_re($syslog_facility, '^(kern|user|mail|daemon|auth|syslog|lpr|news|uucp|cron|authpriv|ftp|local[0-7])$')
      }

      if ($syslog_identifier != undef) {
        validate_string($syslog_identifier)
      }

      if ($syslog_level != undef) {
        validate_re($syslog_level, '^(emerg|alert|crit|err|warning|notice|info|debug)$')
      }

      if ($syslog_level_prefix != undef) {
        validate_bool($syslog_level_prefix)
      }

      any2array($system_call_architectures)

      if ($system_call_error_number != undef) {
        validate_string($system_call_error_number)
      }

      any2array($system_call_filter)

      if ($tasks_accounting != undef) {
        validate_bool($tasks_accounting)
      }

      if !is_integer($tasks_max) {
        fail('$tasks_max must be an integer.')
      }

      if ($timeout_sec != undef) {
        validate_string($timeout_sec)
      }

      if ($timeout_start_sec != undef) {
        validate_string($timeout_start_sec)
      }

      if ($timeout_stop_sec != undef) {
        validate_string($timeout_stop_sec)
      }

      if ($timer_slack_nsec != undef) {
        validate_string($timer_slack_nsec)
      }

      if ($tty_path != undef) {
        validate_absolute_path($tty_path)
      }

      if ($tty_reset != undef) {
        validate_bool($tty_reset, '^(yes|no)$')
      }

      if ($tty_v_hangup != undef) {
        validate_bool($tty_v_hangup, '^(yes|no)$')
      }

      if ($tty_vt_disallocate != undef) {
        validate_bool($tty_vt_disallocate, '^(yes|no)$')
      }

      if ($type != undef) {
        validate_re($type, '^(simple|forking|oneshot|dbus|notify|idle)$')
      }

      if ($umask != undef) {
        validate_re($umask, '^\d{4}$', '$umask is not valid. It should be 4 digits (0022 by default).')
      }

      if ($usb_function_descriptors != undef) {
        validate_string($usb_function_descriptors)
      }

      if ($usb_function_strings != undef) {
        validate_string($usb_function_strings)
      }

      if ($user != undef) {
        validate_string($user)
      }

      if ($utmp_identifier != undef) {
        validate_string($utmp_identifier)
      }

      if ($utmp_mode != undef) {
        validate_re($utmp_mode, '^(init|login|user)$')
      }

      if !is_integer($watchdog_sec) {
        fail('$watchdog_sec must be an integer.')
      }

      if ($required_by != undef) {
        validate_absolute_path($working_directory)
      }
    }
    default: {
      fail("${type} is not supported for type. Supported type are 'service', 'swap' and 'automount'.")
    }
  }

  # unit
  any2array($after_unit)

  if ($allow_isolate != undef) {
    validate_bool($allow_isolate)
  }

  if ($assert_acpower != undef) {
    validate_bool($assert_acpower)
  }

  if ($assert_architecture != undef) {
    validate_string($assert_architecture)
  }

  if ($assert_capability != undef) {
    validate_string($assert_capability)
  }

  if ($assert_directory_not_empty != undef) {
    validate_absolute_path($assert_directory_not_empty)
  }

  if ($assert_file_is_executable != undef) {
    validate_absolute_path($assert_file_is_executable)
  }

  if ($assert_file_not_empty != undef) {
    validate_absolute_path($assert_file_not_empty)
  }

  if ($assert_first_boot != undef) {
    validate_bool($assert_first_boot)
  }

  if ($assert_host != undef) {
    validate_string($assert_host)
  }

  if ($assert_kernel_command_line != undef) {
    validate_string($assert_kernel_command_line)
  }

  if ($assert_needs_update != undef) {
    validate_absolute_path($assert_needs_update)
  }

  if ($assert_path_exists != undef) {
    validate_absolute_path($assert_path_exists)
  }

  if ($assert_path_exists_glob != undef) {
    validate_absolute_path($assert_path_exists_glob)
  }

  if ($assert_path_is_directory != undef) {
    validate_absolute_path($assert_path_is_directory)
  }

  if ($assert_path_is_mount_point != undef) {
    validate_absolute_path($assert_path_is_mount_point)
  }

  if ($assert_path_is_read_write != undef) {
    validate_absolute_path($assert_path_is_read_write)
  }

  if ($assert_path_is_symbolic_link != undef) {
    validate_absolute_path($assert_path_is_symbolic_link)
  }

  if ($assert_security != undef) {
    validate_string($assert_security)
  }

  if ($assert_virtualization != undef) {
    validate_string($assert_virtualization)
  }

  any2array($before_unit)

  if ($binds_to != undef) {
    validate_string($binds_to)
  }

  if ($condition_acpower != undef) {
    validate_bool($condition_acpower)
  }

  if ($condition_architecture != undef) {
    validate_string($condition_architecture)
  }

  if ($condition_capability != undef) {
    validate_string($condition_capability)
  }

  if ($condition_directory_not_empty != undef) {
    validate_absolute_path($condition_directory_not_empty)
  }

  if ($condition_file_is_executable != undef) {
    validate_absolute_path($condition_file_is_executable)
  }

  if ($condition_file_not_empty != undef) {
    validate_absolute_path($condition_file_not_empty)
  }

  if ($condition_first_boot != undef) {
    validate_bool($condition_first_boot)
  }

  if ($condition_host != undef) {
    validate_string($condition_host)
  }

  if ($condition_kernel_command_line != undef) {
    validate_string($condition_kernel_command_line)
  }

  if ($condition_needs_update != undef) {
    validate_absolute_path($condition_needs_update)
  }

  if ($condition_path_exists != undef) {
    validate_absolute_path($condition_path_exists)
  }

  if ($condition_path_exists_glob != undef) {
    validate_absolute_path($condition_path_exists_glob)
  }

  if ($condition_path_is_directory != undef) {
    validate_absolute_path($condition_path_is_directory)
  }

  if ($condition_path_is_mount_point != undef) {
    validate_absolute_path($condition_path_is_mount_point)
  }

  if ($condition_path_is_read_write != undef) {
    validate_absolute_path($condition_path_is_read_write)
  }

  if ($condition_path_is_symbolic_link != undef) {
    validate_absolute_path($condition_path_is_symbolic_link)
  }

  if ($condition_security != undef) {
    validate_string($condition_security)
  }

  if ($condition_virtualization != undef) {
    validate_string($condition_virtualization)
  }
  any2array($conflicts)

  if ($default_dependencies != undef) {
    validate_bool($default_dependencies)
  }

  if ($description != undef) {
    validate_string($description)
  }

  if ($documentation != undef) {
    validate_string($documentation)
  }

  if ($ignore_on_isolate != undef) {
    validate_bool($ignore_on_isolate)
  }

  if ($job_timeout_action != undef) {
    validate_string($job_timeout_action)
  }

  if ($job_timeout_reboot_argument != undef) {
    validate_string($job_timeout_reboot_argument)
  }


  if !is_integer($job_timeout_sec) {
    fail('$job_timeout_sec must be an integer.')
  }

  any2array($joins_namespace_of)
  any2array($on_failure)

  if ($on_failure_job_mode != undef) {
    validate_string($on_failure_job_mode)
  }

  if ($part_of != undef) {
    validate_string($part_of)
  }

  any2array($propagates_reload_to)

  if ($refuse_manual_start != undef) {
    validate_bool($refuse_manual_start)
  }

  if ($refuse_manual_stop != undef) {
    validate_bool($refuse_manual_stop)
  }
  
  any2array($reload_propagated_from)
  any2array($requires)
  any2array($requires_mounts_for)

  if ($requisite != undef) {
    validate_bool($requisite)
  }

  if ($stop_when_unneeded != undef) {
    validate_bool($stop_when_unneeded)
  }

  if ($wants != undef) {
    validate_string($wants)
  }

  # install
  if ($alias_unit != undef) {
    validate_string($alias_unit)
  }

  if ($also != undef) {
    validate_string($also)
  }

  if ($default_instance != undef) {
    validate_string($default_instance)
  }

  if ($required_by != undef) {
    validate_string($required_by)
  }

  validate_string($wanted_by)

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
    content => template("systemctl/unit/${type}.erb"),
    order   => '02';
  }

  concat::fragment { "install_${unit}.${type}":
    content => template('systemctl/automount.erb'),
    order   => '03';
  }

  if $service_manage {
    $depends = [Concat["${::systemctl::unit_dir}/${unit}.${type}"], Exec['systemctl daemon-reload']]

    $before = $ensure ? {
      absent  => $depends,
      default => undef,
    }

    $require = $ensure ? {
      absent  => undef,
      default => $depends,
    }

    service { "${unit}.${type}":
      ensure   => $service_ensure,
      enable   => $service_enable,
      before   => $before,
      require  => $require,
      provider => 'systemd';
    }
  }
}