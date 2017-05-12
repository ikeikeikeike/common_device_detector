defmodule CommonDeviceDetector.Download.ShortCodeMaps do
  alias CommonDeviceDetector.Download
  alias Mix.UAInspector.ShortCodeMap, as: Util

  alias UAInspector.{Config, ShortCodeMap}

  @maps [
    ShortCodeMap.ClientBrowsers,
    ShortCodeMap.DeviceBrands,
    ShortCodeMap.MobileBrowsers,
    ShortCodeMap.OSs
  ]

  def run do
    IO.puts "UAInspector Short Code Map Download"

    case Config.database_path do
      nil -> Download.exit_unconfigured()
      _   -> run_confirmed()
    end
  end

  defp run_confirmed do
    Download.prepare_database_path()
    :ok = @maps |> download()

    IO.puts "Download complete!"

    :ok
  end

  defp download([]),            do: :ok
  defp download([map | maps]) do
    IO.puts ".. downloading: #{ map.file_local }"

    yaml = Path.join([Config.database_path, map.file_local])
    temp = "#{ yaml }.tmp"

    download_database(map.file_remote, temp)

    :ok =
         map.var_name
      |> Util.extract(map.var_type, temp)
      |> Util.write_yaml(map.var_type, yaml)

    File.rm! temp

    download(maps)
  end

  defp download_database(remote, local) do
    {:ok, content} = Download.read_remote(remote)

    File.write! local, content
  end
end


