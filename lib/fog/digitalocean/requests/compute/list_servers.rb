module Fog
  module Compute
    class DigitalOcean
      class Real
        def list_servers(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => 'droplets'
          )
        end
      end

      class Mock
        def list_servers
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "status" => "OK",
            "droplets"  => [
              {
                "id" => 3164444,
                "name" => "example.com",
                "memory" => 512,
                "vcpus" => 1,
                "disk" => 20,
                "locked" => false,
                "status" => "active",
                "kernel" => {
                  "id" => 2233,
                  "name" => "Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic",
                  "version" => "3.13.0-37-generic"
                },
                "created_at" => "2014-11-14T16:29:21Z",
                "features" => [
                  "backups",
                  "ipv6",
                  "virtio"
                ],
                "backup_ids" => [
                  7938002
                ],
                "snapshot_ids" => [

                ],
                "image" => {
                  "id" => 6918990,
                  "name" => "14.04 x64",
                  "distribution" => "Ubuntu",
                  "slug" => "ubuntu-14-04-x64",
                  "public" => true,
                  "regions" => [
                    "nyc1",
                    "ams1",
                    "sfo1",
                    "nyc2",
                    "ams2",
                    "sgp1",
                    "lon1",
                    "nyc3",
                    "ams3",
                    "nyc3"
                  ],
                  "created_at" => "2014-10-17T20:24:33Z",
                  "min_disk_size" => 20
                },
                "size_slug" => "512mb",
                "networks" => {
                  "v4" => [
                    {
                      "ip_address" => "104.236.32.182",
                      "netmask" => "255.255.192.0",
                      "gateway" => "104.236.0.1",
                      "type" => "public"
                    }
                  ],
                  "v6" => [
                    {
                      "ip_address" => "2604:A880:0800:0010:0000:0000:02DD:4001",
                      "netmask" => 64,
                      "gateway" => "2604:A880:0800:0010:0000:0000:0000:0001",
                      "type" => "public"
                    }
                  ]
                },
                "region" => {
                  "name" => "New York 3",
                  "slug" => "nyc3",
                  "sizes" => [],
                  "features" => [
                    "virtio",
                    "private_networking",
                    "backups",
                    "ipv6",
                    "metadata"
                  ],
                  "available" => nil
                }
              }
            ]
          }
          response
        end
      end
    end
  end
end
