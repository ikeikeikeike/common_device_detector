defmodule CommonDeviceDetector.Download do
  alias UAInspector.Config

  def exit_unconfigured do
    IO.puts "Database path not configured."
    IO.puts "See README.md for details."
  end

  def prepare_database_path do
    unless File.dir?(Config.database_path) do
      Config.database_path |> File.mkdir_p!
    end

    IO.puts "Download path: #{ Config.database_path }"
    IO.puts "This command will overwrite any existing files!"
  end

  def read_remote(path) do
    {:ok, _} = Application.ensure_all_started(:hackney)

    http_opts           = Application.get_env(:ua_inspector, :http_opts, [])
    {:ok, _, _, client} = :hackney.get(path, [], [], http_opts)

    :hackney.body(client)
  end
end
