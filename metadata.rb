name 'weave_net'
maintainer 'Maxim Vasilev'
maintainer_email 'admin@qwertys.ru'
license 'Public domain'
description 'Installs Weave Net on docker host'
long_description 'Installs Weave Net on docker host.'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'docker'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/weave_net/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/weave_net'
