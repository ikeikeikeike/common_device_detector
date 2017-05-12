defmodule CommonDeviceDetectorTest do
  use ExUnit.Case
  alias CommonDeviceDetector.Detector

  doctest CommonDeviceDetector.Application

  # Mobile Phones
  @samsung_galaxy_s6 "Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36"
  @samsung_galaxy_s6_edge_plus "Mozilla/5.0 (Linux; Android 5.1.1; SM-G928X Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36"
  @sony_xperia_z5 "Mozilla/5.0 (Linux; Android 6.0.1; E6653 Build/32.2.A.0.253) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36"
  @nexus_6p "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 6P Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36"

  # Tablets
  @google_pixel_c "Mozilla/5.0 (Linux; Android 7.0; Pixel C Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/52.0.2743.98 Safari/537.36"
  @amazon_kindle_fire_hdx_7 "Mozilla/5.0 (Linux; Android 4.4.3; KFTHWI Build/KTU84M) AppleWebKit/537.36 (KHTML, like Gecko) Silk/47.1.79 like Chrome/47.0.2526.80 Safari/537.36"
  @samsung_galaxy_tab_a "Mozilla/5.0 (Linux; Android 5.0.2; SAMSUNG SM-T550 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.3 Chrome/38.0.2125.102 Safari/537.36"
  @sony_xperia_z4_tablet "Mozilla/5.0 (Linux; Android 6.0.1; SGP771 Build/32.2.A.0.253; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/52.0.2743.98 Safari/537.36"

  # Set Top Boxes
  @chromecast "Mozilla/5.0 (CrKey armv7l 1.5.16041) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.0 Safari/537.36"
  @amazon_fire_tv "Mozilla/5.0 (Linux; Android 4.2.2; AFTB Build/JDQ39) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.173 Mobile Safari/537.22"
  @apple_tv_4th_gen "AppleTV5,3/9.1.1"

  # Game consoles
  @nintendo_wii_u "Mozilla/5.0 (Nintendo WiiU) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.4.2.12 NintendoBrowser/4.3.1.11264.US"
  @playstation_4 "Mozilla/5.0 (PlayStation 4 3.11) AppleWebKit/537.73 (KHTML, like Gecko)"
  @xbox_one "Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Xbox; Xbox One) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.10586"

  # E Readers
  @amazon_kindle_4 "Mozilla/5.0 (X11; U; Linux armv7l like Android; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/5.0 Safari/533.2+ Kindle/3.0+"

  # Desktop
  @windows10_edge "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"
  @chromebook "Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36"
  @maxos_safari "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9"
  @windows_chrome "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36"
  @linux_firefox "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15.0.1"

  # Bots and crawlers
  @google_bot "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
  @bing_bot "Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)"
  @yahoo_bot "Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"

  test "Mobile Phones" do
    assert Detector.mobile?(@samsung_galaxy_s6)
    assert Detector.mobile?(@samsung_galaxy_s6_edge_plus)
    assert Detector.mobile?(@sony_xperia_z5)
    assert Detector.mobile?(@nexus_6p)

    assert Detector.smartphone?(@samsung_galaxy_s6)
    assert Detector.smartphone?(@samsung_galaxy_s6_edge_plus)
    assert Detector.smartphone?(@sony_xperia_z5)
    assert Detector.smartphone?(@nexus_6p)

    assert not Detector.tablet?(@samsung_galaxy_s6)
    assert not Detector.tablet?(@samsung_galaxy_s6_edge_plus)
    assert not Detector.tablet?(@sony_xperia_z5)
    assert not Detector.tablet?(@nexus_6p)

    assert not Detector.desktop?(@samsung_galaxy_s6)
    assert not Detector.desktop?(@samsung_galaxy_s6_edge_plus)
    assert not Detector.desktop?(@sony_xperia_z5)
    assert not Detector.desktop?(@nexus_6p)
  end

  test "Tablets" do
    assert Detector.mobile?(@google_pixel_c)
    assert Detector.mobile?(@amazon_kindle_fire_hdx_7)
    assert Detector.mobile?(@samsung_galaxy_tab_a)
    assert Detector.mobile?(@sony_xperia_z4_tablet)

    assert Detector.tablet?(@google_pixel_c)
    assert Detector.tablet?(@amazon_kindle_fire_hdx_7)
    assert Detector.tablet?(@samsung_galaxy_tab_a)
    assert Detector.tablet?(@sony_xperia_z4_tablet)

    assert not Detector.smartphone?(@google_pixel_c)
    assert not Detector.smartphone?(@amazon_kindle_fire_hdx_7)
    assert not Detector.smartphone?(@samsung_galaxy_tab_a)
    assert not Detector.smartphone?(@sony_xperia_z4_tablet)

    assert not Detector.desktop?(@google_pixel_c)
    assert not Detector.desktop?(@amazon_kindle_fire_hdx_7)
    assert not Detector.desktop?(@samsung_galaxy_tab_a)
    assert not Detector.desktop?(@sony_xperia_z4_tablet)
  end

  test "Set Top Boxes" do
    assert not Detector.mobile?(@chromecast)
    assert not Detector.mobile?(@amazon_fire_tv)
    assert not Detector.mobile?(@apple_tv_4th_gen)

    assert Detector.tv?(@chromecast)
    assert Detector.tv?(@amazon_fire_tv)
    assert Detector.tv?(@apple_tv_4th_gen)
  end


  test "Game consoles" do
    assert not Detector.mobile?(@nintendo_wii_u)
    assert not Detector.mobile?(@playstation_4)
    assert not Detector.mobile?(@xbox_one)

    assert Detector.console?(@nintendo_wii_u)
    assert Detector.console?(@playstation_4)
    assert Detector.console?(@xbox_one)

    assert Detector.game?(@nintendo_wii_u)
    assert Detector.game?(@playstation_4)
    assert Detector.game?(@xbox_one)
  end


  test "E Readers" do
    assert Detector.mobile?(@amazon_kindle_4)
    assert Detector.tablet?(@amazon_kindle_4)
  end


  test "Desktop" do
    assert not Detector.mobile?(@windows10_edge)
    assert not Detector.mobile?(@chromebook)
    assert not Detector.mobile?(@maxos_safari)
    assert not Detector.mobile?(@windows_chrome)
    assert not Detector.mobile?(@linux_firefox)

    assert Detector.desktop?(@windows10_edge)
    assert Detector.desktop?(@chromebook)
    assert Detector.desktop?(@maxos_safari)
    assert Detector.desktop?(@windows_chrome)
    assert Detector.desktop?(@linux_firefox)
  end

  test "Bots and crawlers" do
    assert not Detector.mobile?(@google_bot)
    assert not Detector.mobile?(@bing_bot)
    assert not Detector.mobile?(@yahoo_bot)
    assert not Detector.smartphone?(@google_bot)
    assert not Detector.smartphone?(@bing_bot)
    assert not Detector.smartphone?(@yahoo_bot)

    assert Detector.bot?(@google_bot)
    assert Detector.bot?(@bing_bot)
    assert Detector.bot?(@yahoo_bot)
    assert Detector.desktop?(@google_bot)
    assert Detector.desktop?(@bing_bot)
    assert Detector.desktop?(@yahoo_bot)
  end

  # test "output" do
    # # Mobile Phones
    # IO.puts "-------------"
    # IO.puts "Mobile Phones"
    # IO.inspect(UAInspector.parse @samsung_galaxy_s6)
    # IO.inspect(UAInspector.parse @samsung_galaxy_s6_edge_plus)
    # IO.inspect(UAInspector.parse @sony_xperia_z5)
    # IO.inspect(UAInspector.parse @nexus_6p)

    # # Tablets
    # IO.puts "-------------"
    # IO.puts "Tablets"
    # IO.inspect(UAInspector.parse @google_pixel_c)
    # IO.inspect(UAInspector.parse @amazon_kindle_fire_hdx_7)
    # IO.inspect(UAInspector.parse @samsung_galaxy_tab_a)
    # IO.inspect(UAInspector.parse @sony_xperia_z4_tablet)

    # # Set Top Boxes
    # IO.puts "-------------"
    # IO.puts "Set Top Boxes"
    # IO.inspect(UAInspector.parse @chromecast)
    # IO.inspect(UAInspector.parse @amazon_fire_tv)
    # IO.inspect(UAInspector.parse @apple_tv_4th_gen)

    # # Game consoles
    # IO.puts "-------------"
    # IO.puts "Game consoles"
    # IO.inspect(UAInspector.parse @nintendo_wii_u)
    # IO.inspect(UAInspector.parse @playstation_4)
    # IO.inspect(UAInspector.parse @xbox_one)

    # # E Readers
    # IO.puts "-------------"
    # IO.puts "E Readers"
    # IO.inspect(UAInspector.parse @amazon_kindle_4)

    # # Desktop
    # IO.puts "-------------"
    # IO.puts "Desktop"
    # IO.inspect(UAInspector.parse @windows10_edge)
    # IO.inspect(UAInspector.parse @chromebook)
    # IO.inspect(UAInspector.parse @maxos_safari)
    # IO.inspect(UAInspector.parse @windows_chrome)
    # IO.inspect(UAInspector.parse @linux_firefox)

    # # Bots and crawlers
    # IO.puts "-------------"
    # IO.puts "Bots and crawlers"
    # IO.inspect(UAInspector.parse @google_bot)
    # IO.inspect(UAInspector.parse @bing_bot)
    # IO.inspect(UAInspector.parse @yahoo_bot)

  # end

end
