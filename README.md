# CommonDeviceDetector

Faster device detector.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add `common_device_detector` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:common_device_detector, "~> 0.2"}]
end
```

2. Ensure `common_device_detector` is started before your application:

```elixir
def application do
  [applications: [:common_device_detector]]
end
```

3. Configure databases. here
https://github.com/elixytics/ua_inspector#parser-databases


## Usage

##### Basic

```elixir
iex(1)> alias CommonDeviceDetector.Detector
iex(2)> ua = "Mozilla /5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
iex(3)> Detector.smartphone? ua
true
iex(4)> Detector.desktop? ua
false
iex(5)> Detector.mobile? ua
true
iex(6)> Detector.tablet? ua
false
iex(7)> Detector.game? ua
false
iex(8)> Detector.tv? ua
false
iex(9)> Detector.bot? ua
false
```

##### Plug

```elixir
iex(1)> alias CommonDeviceDetector.Detector
iex(2)> %Plug.Conn{} = conn
iex(3)> Detector.smartphone? conn
true
iex(4)> Detector.desktop? conn
false
iex(5)> Detector.mobile? conn
true
iex(6)> Detector.tablet? conn
false
iex(7)> Detector.game? ua
false
iex(8)> Detector.tv? ua
false
iex(9)> Detector.bot? ua
false
```

##### Migration database on production such as a phoenix with distillery

CommonDeviceDetector can download database on Production environment

```zsh
$ bin/myapp command CommonDeviceDetector.DownloadTasks run
Loading ua_inspector..
Starting dependencies..
UAInspector Database Download
Download path: /path/to/ua_inspector
This command will overwrite any existing files!
.. downloading: bot.bots.yml
.. downloading: browser_engine.browser_engine.yml
.. downloading: client.feed_readers.yml
.. downloading: client.mobile_apps.yml
.. downloading: client.mediaplayers.yml
.. downloading: client.pim.yml
.. downloading: client.browsers.yml
.. downloading: client.libraries.yml
.. downloading: device.televisions.yml
.. downloading: device.consoles.yml
.. downloading: device.car_browsers.yml
.. downloading: device.cameras.yml
.. downloading: device.portable_media_player.yml
.. downloading: device.mobiles.yml
.. downloading: os.oss.yml
.. downloading: vendor_fragment.vendorfragments.yml
Download complete!
UAInspector Short Code Map Download
Download path: /path/to/ua_inspector
This command will overwrite any existing files!
.. downloading: short_codes.client_browsers.yml
.. downloading: short_codes.device_brands.yml
.. downloading: short_codes.mobile_browsers.yml
.. downloading: short_codes.oss.yml
Download complete!
Success!
```
