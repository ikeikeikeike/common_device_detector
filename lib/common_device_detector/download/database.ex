defmodule CommonDeviceDetector.Download.Databases do
  alias CommonDeviceDetector.Download
  alias UAInspector.{Config, Database}

  def run do
    IO.puts "UAInspector Database Download"

    case Config.database_path do
      nil -> Download.exit_unconfigured()
      _   -> run_confirmed()
    end
  end

  defp run_confirmed do
    Download.prepare_database_path()
    :ok =
         [
           Database.Bots,
           Database.BrowserEngines,
           Database.Clients,
           Database.Devices,
           Database.OSs,
           Database.VendorFragments
         ]
      |> download()

    IO.puts "Download complete!"

    :ok
  end

  defp download([]),                      do: :ok
  defp download([database | databases]) do
    for {_type, local, remote} <- database.sources do
      IO.puts ".. downloading: #{ local }"

      target = Path.join([Config.database_path, local])

      download_database(remote, target)
    end

    download(databases)
  end

  defp download_database(remote, local) do
    {:ok, content} = Download.read_remote(remote)

    File.write! local, content
  end
end
