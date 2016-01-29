#
# Author:: Andrew Miller (<ikari7789@yahoo.com>)
# Recipe:: yum-remi-chef::remi-php70-test
#
# Copyright 2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'yum-epel' unless node['platform'] == 'fedora'
include_recipe 'yum-remi-chef::remi-safe' unless node['platform'] == 'fedora'
include_recipe 'yum-remi-chef::remi'
include_recipe 'yum-remi-chef::remi-php70'

%w(
  remi-php55
  remi-php55-debuginfo
  remi-php56
  remi-php56-debuginfo
).each do |repo|
  yum_repository "remi-php70-test-delete-#{repo}" do
    repositoryid node['yum'][repo]['repositoryid']
    action :delete
  end
end

%w(
  remi-php70-test
  remi-php70-test-debuginfo
).each do |repo|
  next unless node['yum'][repo]['managed']

  yum_repository repo do
    baseurl node['yum'][repo]['baseurl'] unless node['yum'][repo]['baseurl'].nil?
    cost node['yum'][repo]['cost'] unless node['yum'][repo]['cost'].nil?
    clean_metadata node['yum'][repo]['clean_metadata'] unless node['yum'][repo]['clean_metadata'].nil?
    description node['yum'][repo]['description'] unless node['yum'][repo]['description'].nil?
    enabled node['yum'][repo]['enabled'] unless node['yum'][repo]['enabled'].nil?
    enablegroups node['yum'][repo]['enablegroups'] unless node['yum'][repo]['enablegroups'].nil?
    exclude node['yum'][repo]['exclude'] unless node['yum'][repo]['exclude'].nil?
    failovermethod node['yum'][repo]['failovermethod'] unless node['yum'][repo]['failovermethod'].nil?
    fastestmirror_enabled node['yum'][repo]['fastestmirror_enabled'] unless node['yum'][repo]['fastestmirror_enabled'].nil?
    gpgcheck node['yum'][repo]['gpgcheck'] unless node['yum'][repo]['gpgcheck'].nil?
    gpgkey node['yum'][repo]['gpgkey'] unless node['yum'][repo]['gpgkey'].nil?
    http_caching node['yum'][repo]['http_caching'] unless node['yum'][repo]['http_caching'].nil?
    include_config node['yum'][repo]['include_config'] unless node['yum'][repo]['include_config'].nil?
    includepkgs node['yum'][repo]['includepkgs'] unless node['yum'][repo]['includepkgs'].nil?
    keepalive node['yum'][repo]['keepalive'] unless node['yum'][repo]['keepalive'].nil?
    make_cache node['yum'][repo]['make_cache'] unless node['yum'][repo]['make_cache'].nil?
    max_retries node['yum'][repo]['max_retries'] unless node['yum'][repo]['max_retries'].nil?
    metadata_expire node['yum'][repo]['metadata_expire'] unless node['yum'][repo]['metadata_expire'].nil?
    mirrorexpire node['yum'][repo]['mirrorexpire'] unless node['yum'][repo]['mirrorexpire'].nil?
    mirrorlist node['yum'][repo]['mirrorlist'] unless node['yum'][repo]['mirrorlist'].nil?
    mirror_expire node['yum'][repo]['mirror_expire'] unless node['yum'][repo]['mirror_expire'].nil?
    mirrorlist_expire node['yum'][repo]['mirrorlist_expire'] unless node['yum'][repo]['mirrorlist_expire'].nil?
    mode node['yum'][repo]['mode'] unless node['yum'][repo]['mode'].nil?
    priority node['yum'][repo]['priority'] unless node['yum'][repo]['priority'].nil?
    proxy node['yum'][repo]['proxy'] unless node['yum'][repo]['proxy'].nil?
    proxy_username node['yum'][repo]['proxy_username'] unless node['yum'][repo]['proxy_username'].nil?
    proxy_password node['yum'][repo]['proxy_password'] unless node['yum'][repo]['proxy_password'].nil?
    username node['yum'][repo]['username'] unless node['yum'][repo]['username'].nil?
    password node['yum'][repo]['password'] unless node['yum'][repo]['password'].nil?
    repo_gpgcheck node['yum'][repo]['repo_gpgcheck'] unless node['yum'][repo]['repo_gpgcheck'].nil?
    report_instanceid node['yum'][repo]['report_instanceid'] unless node['yum'][repo]['report_instanceid'].nil?
    repositoryid node['yum'][repo]['repositoryid'] unless node['yum'][repo]['repositoryid'].nil?
    skip_if_unavailable node['yum'][repo]['skip_if_unavailable'] unless node['yum'][repo]['skip_if_unavailable'].nil?
    source node['yum'][repo]['source'] unless node['yum'][repo]['source'].nil?
    sslcacert node['yum'][repo]['sslcacert'] unless node['yum'][repo]['sslcacert'].nil?
    sslclientcert node['yum'][repo]['sslclientcert'] unless node['yum'][repo]['sslclientcert'].nil?
    sslclientkey node['yum'][repo]['sslclientkey'] unless node['yum'][repo]['sslclientkey'].nil?
    sslverify node['yum'][repo]['sslverify'] unless node['yum'][repo]['sslverify'].nil?
    timeout node['yum'][repo]['timeout'] unless node['yum'][repo]['timeout'].nil?
    options node['yum'][repo]['options'] unless node['yum'][repo]['options'].nil?
    action :create
  end
end