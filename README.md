# systemctl

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with systemctl](#setup)
    * [What systemctl affects](#what-systemctl-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with systemctl](#beginning-with-systemctl)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The systemctl module helps you to manage service, mount and automount unit files. 

## Module Description

The module is designed to managed systemd service unit files. You can configure unit files within hiera or in
the old plain puppet syntax. 

## Setup

### What systemctl affects

* This module will put all unit files in /etc/systemd/system. 

### Setup Requirements

systemctl uses Ruby-based providers, so you must enable [pluginsync](http://docs.puppetlabs.com/guides/plugins_in_modules.html?_ga=1.113888711.1107955408.1439134773#enabling-pluginsync).

### Beginning with systemctl

Basic requirement for a simple unit file:

~~~puppet
systemctl::unit { 'myapp':
  ensure      => present,
  exec_start  => '/usr/local/bin/myapp';
}
~~~

Also you can set some optional parameters:
 
~~~puppet
systemctl::unit { 'myapp':
  ensure      => present,
  description => 'My fancy application!',
  exec_start  => '/usr/local/bin/myapp start',
  exec_stop   => '/usr/local/bin/myapp stop';
}
~~~


Fore more paramters, see unit.pp and [man systemd.service](http://www.freedesktop.org/software/systemd/man/systemd.service.html)

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Classes:
* [systemctl](class-systemctl)

Functions:
* [systemctl_bool](function-systemctl_bool)

Resources:
* [unit](resource-unit)

### Class: systemctl
Perforce tasks like purge unmanaged unit files
~~~puppet
class { 'systemctl':
  purge => true;
}
~~~

You can set the default path for unit files.
~~~puppet
class { 'systemctl':
  unit_dir => '/etc/systemd/system';
}
~~~

#### Parameters

* `purge`: Purge all unmanaged unit files. Defaults to false.
* `unit_dir`: Directory, where all unit files are saved. Defaults to '/etc/systemd/system'
* `default_wanted_by`: Default value for the wanted_by parameter in all unit resources. Defaults to 'multi-user.target'
* `units`: Optional hash of with all manged unit resources. Useful for hiera usage.

### Function: systemctl_bool
Only used in template. Returns 'Yes' on true, 'No' on false.
~~~puppet
# returns 'Yes'
$var = systemctl_bool(true)
~~~

### Resource: unit
Define a unit file.
~~~puppet
systemctl::unit { 'myapp':
  ensure      => present,
  description => 'My fancy application!',
  exec_start  => '/usr/local/bin/myapp start',
  exec_stop   => '/usr/local/bin/myapp stop';
}
~~~


#### Parameters

* `ensure`: Define, if unit file exits. Valid values are 'present' and 'absent'.
* `unit`: Name of the unit file.
* `unit_type`: Type of the unit file. Defaults to 'service'. Valid values are 'automount', 'swap' and 'service'.
* `service_manage`: Should the service based on the new unit file [managed](https://docs.puppetlabs.com/puppet/latest/reference/type.html#service). Defaults to true
* `service_enable`: Should the service based on the new unit file [enabled](https://docs.puppetlabs.com/puppet/latest/reference/type.html#service-attribute-enable). Defaults to true
* `service_ensure`: Should the service based on the new unit file [managed](https://docs.puppetlabs.com/puppet/latest/reference/type.html#service-attribute-ensure). Defaults to 'running'

## Limitations

The module work only systems with active systemd. (You probably want only this module, if systemd is active)

## Development

My modules are open projects. So if you want to make this module even better, you can contribute to this module on [Github](https://github.com/jkroepke/puppet-systemctl).
