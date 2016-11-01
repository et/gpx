defmodule Gpx do
  import SweetXml

  @doc """
  Parses GPX xml into a List of `Gpx.Point`s
  """
  @spec parse(String.t) :: list(Gpx.Point.t)
  def parse(xml) do
    xml
    |> xpath(~x"//trkseg/trkpt"l)
    |> Enum.map(fn(trkpt) ->
      %Gpx.Point{
        lat: trkpt |> xpath(~x"./@lat"f),
        lon: trkpt |> xpath(~x"./@lon"f),
        ele: trkpt |> xpath(~x"./ele/text()"f),
      }
    end)
  end
end
