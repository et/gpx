# Gpx

GPX is a parser for the [GPS Exchange Format](https://en.wikipedia.org/wiki/GPS_Exchange_Format).

## Usage

Use `Gpx.parse` to return a `List` of `Gpx.Point`s.

```
gpx = Gpx.parse("<trkseg><trkpt>...</trkpt><trkpt>...</trkpt></trkseg>")
=> [%Gpx.Point{ele: 4.46, lat: 47.644548, lon: -122.326897}
   ...]
```

## Installation

  1. Add `gpx` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:gpx, "~> 0.1.0"}]
    end
    ```

  2. Ensure `gpx` is started before your application:

    ```elixir
    def application do
      [applications: [:gpx]]
    end
    ```
