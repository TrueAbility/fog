module Fog
  module Compute
    class DigitalOcean
      class Real
        def list_snapshots(id, query = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "droplets/#{id}/snapshots",
            :query    => query
          )
        end
      end

      class Mock
        def list_snapshots(id, query ={})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "snapshots" => [
              {
                "snapshots": [
                  {
                    "id": 7938206,
                    "name": "nginx-fresh",
                    "distribution": "Ubuntu",
                    "slug": null,
                    "public": false,
                    "regions": [
                      "nyc3",
                      "nyc3"
                    ],
                    "created_at": "2014-11-14T16:37:34Z",
                    "type": "snapshot",
                    "min_disk_size": 20
                  }
                ],
                "links": {
                },
                "meta": {
                  "total": 1
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
