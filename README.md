# sonos cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/sonos.svg?style=flat)](https://supermarket.chef.io/cookbooks/sonos)
[![Build Status](https://travis-ci.org/odcinek/sonos-cookbook.svg?branch=master)](https://travis-ci.org/odcinek/sonos-cookbook)
[![Dependency Status](http://img.shields.io/gemnasium/odcinek/sonos-cookbook.svg?style=flat)](https://gemnasium.com/odcinek/sonos-cookbook)

Installs and configures an opinionated selection of [sonos](http://sonos.com/) addons.

As a new sonos user I've found some functionality lacking. Community provides a few projects to fill the gaps, but they are neither easy to install without a ton of fiddling, nor well organised.

This is meant to be run on your chef-managed home server.

Currently provided are:
* airsonos
* node-sonos-web-controller

## TODO
* test on Debian / Fedora
* running on raspberry pi
* take a closer look at chromecast-like solutions

## Platform

Currently supported platforms:

* Ubuntu 14.04

## Usage

Include selected recipes in the runlist. There is nothing to tweak (yet?).

## Recipes

## sonos::airsonos
AirPlay to Sonos
* https://github.com/stephen/airsonos

## sonos::webcontroller
A web based controller for Sonos utilizing web sockets for a native look and feel
* https://github.com/jishi/node-sonos-web-controller

## sonos::default

Includes all other recipes.

# Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Ensure that you add ChefSpec test coverage, and any relevant modifications to the `.kitchen.yml`.
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

# Author

- Author: Marcin Sawicki (<odcinek@gmail.com>)
- Copyright:: (c) 2015, Marcin Sawicki

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
