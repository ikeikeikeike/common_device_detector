defmodule CommonDeviceDetector do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(ConCache, [
        [
          ttl_check: :timer.seconds(3),
          ttl: :timer.seconds(1200)
        ],
        [name: :common_device_detector]
      ])
    ]

    opts = [strategy: :one_for_one, name: CommonDeviceDetector.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
