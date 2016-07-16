defmodule CommonDeviceDetector.Mixfile do
  use Mix.Project

  def project do
    [app: :common_device_detector,
     name: "CommonDeviceDetector",
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :plug, :ua_inspector, :con_cache], mod: {CommonDeviceDetector, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ua_inspector, "~> 0.11"},
      {:cowboy, ">= 0.0.0"},
      {:plug, ">= 0.0.0"},
      {:con_cache, ">= 0.0.0"},
      {:yamerl, github: "yakaz/yamerl"},
    ]
  end
end
