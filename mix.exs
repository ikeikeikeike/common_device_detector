defmodule CommonDeviceDetector.Mixfile do
  use Mix.Project

  @description """
  Detect devices that desktop, mobile, smartphone and tabled form User Agent.
  """

  def project do
    [app: :common_device_detector,
     name: "CommonDeviceDetector",
     version: "0.3.1",
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
      {:ua_inspector, "~> 0.14"},
      {:plug, ">= 0.0.0"},
      {:con_cache, ">= 0.0.0"},

      {:credo, "~> 0.8", only: [:dev, :test]},
      {:ex_doc, "~> 0.14", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:inch_ex, ">= 0.0.0", only: :docs}
    ]
  end

  defp package do
    [ maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/ikeikeikeike/common_device_detector"} ]
  end

end
