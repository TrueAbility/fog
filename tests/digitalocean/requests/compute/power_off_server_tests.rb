Shindo.tests('Fog::Compute[:digitalocean] | power_off_server request', ['digitalocean', 'compute']) do

  service = Fog::Compute[:digitalocean]

  tests('success') do

    tests('#power_off_server').formats({'status' => 'OK', 'event_id' => Integer}) do
      data = Fog::Compute[:digitalocean].power_off_server(fog_server_name)
      data.body
    end
  end
end
