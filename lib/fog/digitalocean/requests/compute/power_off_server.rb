module Fog
  module Compute
    class DigitalOcean
      class Real
        def power_off_server(server_id)
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "droplets/#{server_id}/power_off"
          )
        end
      end

      class Mock
        def power_off_server(server_id)
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
