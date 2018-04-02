#
# Inspec test for windows_fx on windows platform family
#
# the Inspec refetence, with examples and extensive documentation, can be
# found at https://inspec.io/docker/reference/resources/
#
control "windows_fx - #{os.name} #{os.release} - 01" do
  describe powershell('$(get-itemproperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable).ProxyEnable') do
    its('stdout') { should match(/1/) }
  end
  describe powershell('$(get-itemproperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer).ProxyServer') do
    # Not matching with regex to allow for IPv6 addresses
    its('stdout') { should match(/^\d{1,3}(\.\d{1,3}){3}:\d+/) }
  end
end
