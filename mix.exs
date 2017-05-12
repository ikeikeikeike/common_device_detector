defmodule CommonDeviceDetector.Mixfile do
  use Mix.Project

  @description """
  Detect devices that desktop, mobile, smartphone and tabled form User Agent.
  """

  def project do
    [app: :common_device_detector,
     name: "CommonDeviceDetector",
     version: "0.2.0",
     elixir: ">= 1.0.0",
     description: @description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps(),
     source_url: "https://github.com/ikeikeikeike/common_device_detector"]
  end

  def application do
    [applications: [:logger, :ua_inspector, :plug, :con_cache],
     mod: {CommonDeviceDetector.Application, []}]
  end

  defp deps do
    [
      {:ua_inspector, "~> 0.13"},
      {:plug, ">= 0.0.0"},
      {:con_cache, ">= 0.0.0"},
    ]
  end

  defp package do
    [ maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/ikeikeikeike/common_device_detector"} ]
  end

end
