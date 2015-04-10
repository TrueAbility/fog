require 'fog/core/model'

module Fog
  module Compute
    class DigitalOcean
      class Image < Fog::Model
        identity  :id
        attribute :slug # May be null
        attribute :name
        attribute :distribution

        def destroy
          requires :id
          service.destroy_image(self.id)
        end

      end
    end
  end
end
