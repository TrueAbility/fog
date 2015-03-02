module Fog
  module Compute
    class DigitalOcean
      class Real
        def snapshot_server(server_id)
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "droplets/#{server_id}",
            :query    => {:type => "snapshot"}
          )
        end
      end

      class Mock
        def snapshot_server(server_id)
          response = Excon::Response.new
          response.status = 200

          mock_data = {
              "id"              =>  Fog::Mock.random_numbers(1).to_i,
              "status"          => "in-progress",
              "type"            => "snapshot",
              "started_at"      => Time.now.strftime("%FT%TZ"),
              "completed_at"    => "null",
              "resource_id"     => Fog::Mock.random_numbers(2).to_i,
              "resource_type"   => "droplet",
              "region"          => "nyc3",
              "region_slug"     => "nyc3"
          }
          response.body = {
            "status" => "OK",
            "action" => mock_data
          }
          server = self.data[:servers].first
          server[:status] = "active"
          self.data[:servers] = [server]
          response
        end
      end
    end
  end
end
