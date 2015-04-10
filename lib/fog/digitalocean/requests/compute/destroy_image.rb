module Fog
  module Compute
    class DigitalOcean
      class Real
        
        def destroy_image( id )
          request(
            :expects  => [200],
            :method   => 'DELETE',
            :path     => "images/#{id}"
          )
        end
      end

      class Mock
        def destroy_image( id )
          response = Excon::Response.new
          response.status = 200
          response
        end
      end
    end
  end
end
