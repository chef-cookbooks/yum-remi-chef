default['yum']['remi-php74']['repositoryid'] = 'remi-php74'
default['yum']['remi-php74']['gpgcheck'] = true
default['yum']['remi-php74']['enabled'] = true
default['yum']['remi-php74']['managed'] = true

case node['platform']
when 'fedora'

  default['yum']['remi-php74']['mirrorlist'] = "http://cdn.remirepo.net/fedora/#{node['platform_version'].to_i}/php74/mirror"
  default['yum']['remi-php74']['description'] = "Remi's PHP 7.4 RPM repository for Fedora Linux #{node['platform_version'].to_i} - $basearch"
when 'amazon'

  default['yum']['remi-php74']['mirrorlist'] = 'http://cdn.remirepo.net/enterprise/7/php74/mirror'
  default['yum']['remi-php74']['description'] = "Remi's PHP 7.4 RPM repository for Enterprise Linux 7 - $basearch"
else

  default['yum']['remi-php74']['mirrorlist'] = "http://cdn.remirepo.net/enterprise/#{node['platform_version'].to_i}/php74/mirror"
  default['yum']['remi-php74']['description'] = "Remi's PHP 7.4 RPM repository for Enterprise Linux #{node['platform_version'].to_i} - $basearch"
end
