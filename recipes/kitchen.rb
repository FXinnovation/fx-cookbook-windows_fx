#
# cookbook::windows_fx
# recipe::kitchen
#
# author::fxinnovation
# description::Recipe for kitchen tests, do not use in production
#

windows_fx_proxy 'default' do
  ip       node['windows_fx']['ip']
  port     node['windows_fx']['port']
  override node['windows_fx']['override']
  action   :create
end
