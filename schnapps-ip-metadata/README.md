# xtuc/schnapps-ip-metadata

> Query https://github.com/ByteArena/schnapps's metadata server and configures the network.

| Name          | Description   |
| ------------- |:-------------:|
| PORT=8080 | Port of the metadata server (not configurable) |
| IFACE=eth0 | Interface which is going to have the IP assigned (not configurable) |
| BOOT_TMP_IP | Temporary IP which is used for the request to the metadata server |
| LOG_DEVICE | Device used for logging |
| METADATA_SERVER | IP where the metadata server can be reached |

## Usage

### Example with Linuxkit

```yml
  - name: ip-metadata
    image: xtuc/schnapps-ip-metadata:latest
    env:
      - BOOT_TMP_IP=172.19.0.9
      - METADATA_SERVER=172.19.0.1
      - LOG_DEVICE=/dev/ttyS0
    capabilities:
      - all
    binds:
      - /dev/ttyS0:/dev/ttyS0

```
