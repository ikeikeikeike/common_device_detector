defmodule CommonDeviceDetector.Detector do
  @moduledoc """
  $ grep 'device: ' *.yml | awk '{print $2,$3,$4,$5,$6,$7,$8}' | sort | uniq
  device: 'camera'
  device: 'car browser'
  device: 'console'
  device: 'desktop'
  device: 'feature phone'
  device: 'phablet'
  device: 'portable media player'
  device: 'smart display'
  device: 'smartphone'
  device: 'tablet'
  device: 'tv'
  device: 'tv' # set top box
  """
  alias UAInspector.{Result,Parser}

  def desktop?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> desktop?()
  end
  def desktop?(useragent) do
    ConCache.get_or_store :common_device_detector, "DeviceDetector.desktop?:#{useragent}", fn ->
      case Parser.parse(useragent) do
        %Result{device: %Result.Device{type: "desktop"}} ->
          true

        # Follbacks
        %Result{device: %Result.Device{type: "smartphone"}} ->
          false
        %Result{device: %Result.Device{type: "tablet"}} ->
          false
        %Result{device: %Result.Device{type: "smart display"}} ->
          false
        %Result{device: %Result.Device{type: "feature phone"}} ->
          false
        %Result{device: %Result.Device{type: "phablet"}} ->
          false
        %Result{device: %Result.Device{type: "portable media player"}} ->
          false
        %Result{device: %Result.Device{type: "camera"}} ->
          false
        %Result{device: %Result.Device{type: "car browser"}} ->
          false

        %Result.Bot{user_agent: ua} ->
          ! Regex.match?(~r/mobile/i, ua)

        _ ->
          true
      end
    end
  end

  def mobile?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> mobile?()
  end
  def mobile?(useragent) do
    ConCache.get_or_store :common_device_detector, "DeviceDetector.mobile?:#{useragent}", fn ->
      case Parser.parse(useragent) do
        %Result{device: %Result.Device{type: "desktop"}} ->
          false
        %Result{device: %Result.Device{type: "console"}} ->
          false
        %Result{device: %Result.Device{type: "tv"}} ->
          false
        %Result{device: %Result.Device{type: :unknown, brand: :unknown, model: :unknown}} ->
          false

        %Result.Bot{user_agent: ua} ->
          Regex.match?(~r/mobile/i, ua)

        _ ->
          true
      end
    end
  end

  def smartphone?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> smartphone?()
  end
  def smartphone?(useragent) do
    ConCache.get_or_store :common_device_detector, "DeviceDetector.smartphone?:#{useragent}", fn ->
      case mobile?(useragent) && Parser.parse(useragent) do
        %Result{device: %Result.Device{type: "smartphone"}} ->
          true

        # Follbacks
        %Result{device: %Result.Device{type: "tablet"}} ->
          false
        %Result{device: %Result.Device{type: "smart display"}} ->
          false
        %Result{device: %Result.Device{type: "car browser"}} ->
          false
        false ->
          false

        %Result.Bot{user_agent: ua} ->
          Regex.match?(~r/mobile/i, ua)

        _ ->
          true
      end
    end
  end

  def tablet?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> tablet?()
  end
  def tablet?(useragent) do
    ConCache.get_or_store :common_device_detector, "DeviceDetector.tablet?:#{useragent}", fn ->
      case mobile?(useragent) && Parser.parse(useragent) do
        %Result{device: %Result.Device{type: "tablet"}} ->
          true

        # Follbacks
        %Result{device: %Result.Device{type: "smartphone"}} ->
          false
        %Result{device: %Result.Device{type: "feature phone"}} ->
          false
        %Result{device: %Result.Device{type: "phablet"}} ->
          false
        %Result{device: %Result.Device{type: "portable media player"}} ->
          false
        %Result{device: %Result.Device{type: "camera"}} ->
          false
        false ->
          false

        _ ->
          true
      end
    end
  end

  def console?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> console?()
  end
  def console?(useragent) do
    ConCache.get_or_store :common_device_detector, "DeviceDetector.console?:#{useragent}", fn ->
      case Parser.parse(useragent) do
        %Result{device: %Result.Device{type: "console"}} ->
          true

        _ ->
          false
      end
    end
  end
  defdelegate game?(value), to: __MODULE__, as: :console?

  def tv?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> tv?()
  end
  def tv?(useragent) do
    ConCache.get_or_store :common_device_detector, "DeviceDetector.tv?:#{useragent}", fn ->
      case Parser.parse(useragent) do
        %Result{device: %Result.Device{type: "tv"}} ->
          true

        _ ->
          false
      end
    end
  end

  def bot?(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first
    |> bot?()
  end
  def bot?(useragent) do
    ConCache.get_or_store :common_device_detector, "UAInspector.bot?:#{useragent}", fn ->
      UAInspector.bot? useragent
    end
  end

end
