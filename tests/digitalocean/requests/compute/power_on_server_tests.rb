Shindo.tests('Fog::Compute[:digitalocean] | power_on_server request', ['digitalocean', 'compute']) do

  service = Fog::Compute[:digitalocean]

  tests('success') do

    tests('#power_on_server').formats({'status' => 'OK', 'event_id' => Integer}) do
      data = Fog::Compute[:digitalocean].power_on_server(fog_server_name)
      data.body
    end
  end
end
