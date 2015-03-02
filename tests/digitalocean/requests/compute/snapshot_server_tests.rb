Shindo.tests('Fog::Compute[:digitalocean] | snapshot_server request', ['digitalocean', 'compute']) do

  @server_format = {
    'id'            => Integer,
    'status'        => String,
    'type'          => String,
    'started_at'    => String,
    'completed_at'  => String,
    'resource_id'   => Integer,
    'resource_type' => String,
    'region'        => String,
    'region_slug'   => String
  }

  service = Fog::Compute[:digitalocean]

  tests('success') do

    tests('#snapshot_server').formats({'status' => 'OK', 'action' => @server_format}) do
      data = Fog::Compute[:digitalocean].snapshot_server(fog_server_name)
      data.body
    end
  end
end
