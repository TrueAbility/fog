Shindo.tests('Fog::Compute[:digitalocean] | destroy_image request', ['digitalocean', 'compute']) do

  service = Fog::Compute[:digitalocean]
  server = fog_test_server

  tests('success') do

    test('#destroy_image') do
      service.destroy_image(server.id).body['status'] == 'OK'
    end

  end
end
