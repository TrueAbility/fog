module Fog
  module Compute
    class DigitalOcean
      class Real
        def snapshot_server( id, name )
          request(
            :expects  => [204],
            :method   => 'POST',
            :path     => "droplets/#{id}/actions",
            :query    => {type: "snapshot", name: name}
          )
        end
      end

      class Mock
        def snapshot_server( id, name )
          response = Excon::Response.new
          response.status = 204

          self.data[:servers].reject! { |s| s['id'] == id }

          response
        end
      end
    end
  end
end
