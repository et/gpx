defmodule GpxTest do
  use ExUnit.Case
  doctest Gpx

  def sample_xml do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <gpx creator="StravaGPX" version="1.1">
      <metadata>
        <time>2016-10-30T14:34:21Z</time>
      </metadata>
      <trk>
        <name>Doudy and Eldo BTC run</name>
        <trkseg>
          <trkpt lat="39.9600780" lon="-105.2365950">
            <ele>1665.4</ele>
            <time>2016-10-30T14:34:21Z</time>
            <extensions>
              <gpxtpx:TrackPointExtension>
                <gpxtpx:cad>0</gpxtpx:cad>
              </gpxtpx:TrackPointExtension>
            </extensions>
          </trkpt>
          <trkpt lat="39.9600450" lon="-105.2366200">
            <ele>1665.4</ele>
            <time>2016-10-30T14:34:22Z</time>
            <extensions>
              <gpxtpx:TrackPointExtension>
                <gpxtpx:cad>0</gpxtpx:cad>
              </gpxtpx:TrackPointExtension>
            </extensions>
          </trkpt>
        </trkseg>
      </trk>
    </gpx>
    """
  end

  test "parse" do
    points = Gpx.parse(sample_xml)
    assert length(points) == 2

    [point1, point2] = points
    assert point1 == %Gpx.Point{
      lat: 39.9600780,
      lon: -105.2365950,
      ele: 1665.4,
      time: ~N[2016-10-30 14:34:21]
    }

    assert point2 == %Gpx.Point{
      lat: 39.9600450,
      lon: -105.2366200,
      ele: 1665.4,
      time: ~N[2016-10-30 14:34:22]
    }
  end

  test "parse_date" do
    assert Gpx.parse_date("2016-10-30T14:34:22Z") == ~N[2016-10-30 14:34:22]
    assert Gpx.parse_date("not valid") == "not valid"
  end
end
