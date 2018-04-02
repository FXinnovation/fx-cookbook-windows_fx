#
# cookbook::windows_fx
# recipe::kitchen
#
# author::fxinnovation
# description::Recipe for kitchen tests, do not use in production
#

windows_fx_proxy 'default' do
  ip       node['windows_fx']['proxy']['ip']
  port     node['windows_fx']['proxy']['port']
  override node['windows_fx']['proxy']['override']
  action   :create
end
