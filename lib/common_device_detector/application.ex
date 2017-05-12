defmodule CommonDeviceDetector.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: BingTranslator.Worker.start_link(arg1, arg2, arg3)
      # worker(BingTranslator.Worker, [arg1, arg2, arg3]),
      worker(ConCache, [
        [ttl_check: :timer.seconds(3), ttl: :timer.seconds(1200)],
        [name: :common_device_detector]
      ])
    ]

    opts = [strategy: :one_for_one, name: CommonDeviceDetector.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
