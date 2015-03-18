require 'fog/core/model'

module Fog
  module Compute
    class DigitalOcean
      class Image < Fog::Model
        identity  :id
        attribute :name
        attribute :distribution

        # Destroy image
        def destroy
          requires :id
          service.destroy_image(self.id)
        end

      end
    end
  end
end
