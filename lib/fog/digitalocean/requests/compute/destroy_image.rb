module Fog
  module Compute
    class DigitalOcean
      class Real
        #
        # FIXME: missing ssh keys support
        #
        def destroy_image( id_or_slug )
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "images/#{id_or_slug}/destroy"
          )
        end
      end

      class Mock
        def destroy_image( id_or_slug )
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "status" => "OK"
          }

          server = self.data[:servers].reject! { |s| s['id'] == id_or_slug }

          response
        end
      end
    end
  end
end
