# CommonDeviceDetector

Faster device detector.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `common_device_detector` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:common_device_detector, github: "ikeikeikeike/common_device_detector"}]
    end
    ```

  2. Ensure `common_device_detector` is started before your application:

    ```elixir
    def application do
      [applications: [:common_device_detector]]
    end
    ```

  3. Install databases. here https://github.com/elixytics/ua_inspector#parser-databases

## Usage

##### Basic

```elixir
iex(1)> ua = "Mozilla /5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
iex(2)> CommonDeviceDetector.Detector.smartphone? ua
true
iex(3)> CommonDeviceDetector.Detector.desktop? ua
false
iex(4)> CommonDeviceDetector.Detector.mobile? ua
true
iex(5)> CommonDeviceDetector.Detector.tabled? ua
false
```

##### Plug

```elixir
iex(1)> %Plug.Conn{} = conn
iex(2)> CommonDeviceDetector.Detector.smartphone? conn
true
iex(3)> CommonDeviceDetector.Detector.desktop? conn
false
iex(4)> CommonDeviceDetector.Detector.mobile? conn
true
iex(5)> CommonDeviceDetector.Detector.tabled? conn
false
```
