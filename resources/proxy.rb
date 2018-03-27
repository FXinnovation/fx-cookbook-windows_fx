#
# cookbook::windows_fx
# resource::windows_fx_proxy
#
# author::fxinnovation
# description::Configures the proxy settings
#

# Defining resource name
resource_name :windows_fx_proxy

# Defining properties
# ip and port are not required in case action :destroy is called
property :ip,       String, sensitive: true
property :port,     Integer
property :override, [true, false], default: true

# Defining install action (default)
action :create do
  if property_is_set(:port) && property_is_set(:ip)
    # Defines hash based on variables
    values_arr = [{ name: 'ProxyEnable',          type: :dword,  data: '1' }]
    values_arr << { name: 'ProxyServer',          type: :string, data: "#{new_resource.ip}:#{new_resource.port}" }
    values_arr << { name: 'ProxyOverride',        type: :string, data: '<local>' } unless new_resource.override
    values_arr << { name: 'ProxySettingsPerUser', type: :dword,  data: '0' }

    registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings' do
      values values_arr
    end
  else
    Chef::Log.fatal('IP and/or port are not defined. They are required if not calling action destroy.')
  end
end

action :destroy do
  registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings' do
    values [
      {
        name: 'ProxyServer',
        type: :string,
        data: '',
      },
      {
        name: 'ProxyOverride',
        type: :string,
        data: '',
      },
    ]
    action :delete
  end
  registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings' do
    values [
      {
        name: 'ProxyEnable',
        type: :dword,
        data: '0',
      },
    ]
    action :create
  end
end
