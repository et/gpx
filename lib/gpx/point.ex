defmodule Gpx.Point do
  @moduledoc """
  A `Gpx.Point` is a struct representation of a GPX trackpoint.
  """

  @type t :: %__MODULE__{
    lat: float,
    lon: float,
    ele: float
  }
  defstruct [
    :lat,
    :lon,
    :ele
  ]
end
