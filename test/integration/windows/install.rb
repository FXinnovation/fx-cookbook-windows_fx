#
# Inspec test for windows_fx on windows platform family
#
# the Inspec refetence, with examples and extensive documentation, can be
# found at https://inspec.io/docker/reference/resources/
#
control "windows_fx - #{os.name} #{os.release} - 01" do
  title 'The computer should have the proxy set'
  describe powershell('$(get-itemproperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable).ProxyEnable') do
    its('stdout') { should match(/0/) }
  end
  describe powershell('$(get-itemproperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer).ProxyServer') do
    # Not matching with regex to allow for IPv6 addresses
    its('stdout') { should exist }
  end
end
