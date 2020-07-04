default['prometheus_exporters']['node']['version'] = '1.0.1'
default['prometheus_exporters']['node']['arch'] = case node['kernel']['machine']
                                                  when 'armv7l'
                                                    'armv7'
                                                  when 'x86_64'
                                                    'amd64'
                                                  end
default['prometheus_exporters']['node']['url'] = "https://github.com/prometheus/node_exporter/releases/download/v#{node['prometheus_exporters']['node']['version']}/node_exporter-#{node['prometheus_exporters']['node']['version']}.#{node['os']}-#{node['prometheus_exporters']['node']['arch']}.tar.gz"
default['prometheus_exporters']['node']['checksum'] = case node['kernel']['machine']
                                                      when 'armv7l'
                                                        'e7f4427a25f1870103588e4968c7dc8c1426c00a0c029d0183a9a7afdd61357b'
                                                      when 'x86_64'
                                                        '3369b76cd2b0ba678b6d618deab320e565c3d93ccb5c2a0d5db51a53857768ae'
                                                      end

default['prometheus_exporters']['node']['textfile_directory'] = '/var/lib/node_exporter/textfile_collector'

default['prometheus_exporters']['node']['ignored_net_devs'] = '^(weave|veth.*|docker0|datapath|dummy0)$'

default['prometheus_exporters']['node']['ignored_mount_points'] = '^/(sys|proc|dev|host|etc|var/lib/docker|run|var/lib/lxcfs|var/lib/kubelet)($|/)'

default['prometheus_exporters']['node']['collectors_enabled'] = %w(
  diskstats
  filefd
  filesystem
  interrupts
  loadavg
  mdadm
  meminfo
  netdev
  netstat
  sockstat
  stat
  tcpstat
  textfile
  time
  uname
  vmstat
)

default['prometheus_exporters']['node']['collectors_disabled'] = %w()
default['prometheus_exporters']['node']['port'] = 9100
default['prometheus_exporters']['node']['user'] = 'root'
