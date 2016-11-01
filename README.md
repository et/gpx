# Gpx

GPX is a parser for the [GPS Exchange Format](https://en.wikipedia.org/wiki/GPS_Exchange_Format).

## Usage

Use `Gpx.parse` to return a `List` of `Gpx.Point`s.

```elixir
{:ok, content} = File.read("/path/to/file.gpx")
points = Gpx.parse(content)
=> [%Gpx.Point{ele: 4.46, lat: 47.644548, lon: -122.326897, time: ~N[2016-10-31 22:30:27]}
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
