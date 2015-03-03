module Fog
  module Compute
    class DigitalOcean
      class Real
        def snapshot_server(server_id, name)
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "droplets/#{server_id}/snapshot",
            :query    => {:name => name}
          )
        end
      end

      class Mock
        def snapshot_server(server_id, name)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "status" => "OK",
            "event_id" => Fog::Mock.random_numbers(4).to_i
          }
          response
        end
      end
    end
  end
end
