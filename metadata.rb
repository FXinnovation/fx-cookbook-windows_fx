name             'windows_fx'
license          'MIT'
maintainer       'FXinnovation'
maintainer_email 'cloudsquad@fxinnovation.com'
description      'Provides configuration options for a windows machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
chef_version     '>= 12.14' if respond_to?(:chef_version)
issues_url       'https://bitbucket.org/fxadmin/public-common-cookbook-windows_fx/issues'
source_url       'https://bitbucket.org/fxadmin/public-common-cookbook-windows_fx'
supports         'windows', '>= 6.1'
