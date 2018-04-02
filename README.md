# windows_fx
The windows_fx cookbook provides resources to perform configurations on Windows servers.
## Requirements
### Cookbooks
N/A

### Chef
* `>= 12.14`

### Platforms
* windows2008r2
* windows2012r2
* windows2016

## Resources
### windows_fx_proxy

#### Properties

| Name | Type | Required | Default | Platform Family | Description |
| ---- | ---- | -------- | ------- | --------------- | ----------- |
| `ip` | `String` | `false` | - | `All` | IP address of proxy server |
| `port` | `Integer` | `false` | - | `All` | Port used on proxy server |
| `override` | `Boolean` | `false` | `true` | `All` | Bypass proxy server for local addresses |

## Versionning
This cookbook will follow semantic versionning 2.0.0 as described [here](https://semver.org/)

## Lisence
MIT

## Contributing
Put link vers contributing here
