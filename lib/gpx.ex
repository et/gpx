defmodule Gpx do
  @moduledoc """
  Gpx is a simple utility for parsing the GPX XML format.
  """

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
        time: trkpt |> xpath(~x"./time/text()"s) |> Gpx.parse_date
      }
    end)
  end

  @doc """
  Tries to parse a date `String` into a `NaiveDateTime`
  If it fails to do so, it simply returns the `String`.
  """
  @spec parse(String.t) :: NaiveDateTime.t | String.t
  def parse_date(date) do
    case NaiveDateTime.from_iso8601(date) do
      {:ok, date} -> date
      {:error, _} -> date
    end
  end
end
