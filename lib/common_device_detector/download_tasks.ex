defmodule CommonDeviceDetector.DownloadTasks do
  alias CommonDeviceDetector.Download

  @start_app :ua_inspector

  def run do
    IO.puts "Loading #{@start_app}.."
    Application.load(@start_app)

    IO.puts "Starting dependencies.."
    # Start apps necessary for executing download
    Application.ensure_all_started @start_app

    # Download ymls
    Download.Databases.run
    Download.ShortCodeMaps.run

    # Signal shutdown
    IO.puts "Success!"
    :init.stop()
  end
end
