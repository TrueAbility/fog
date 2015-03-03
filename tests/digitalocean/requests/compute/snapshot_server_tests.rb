Shindo.tests('Fog::Compute[:digitalocean] | snapshot_server request', ['digitalocean', 'compute']) do

  service = Fog::Compute[:digitalocean]

  tests('success') do

    tests('#snapshot_server').formats({'status' => 'OK', 'event_id' => Integer}) do
      data = Fog::Compute[:digitalocean].snapshot_server(fog_server_name, "test")
      data.body
    end
  end
end
