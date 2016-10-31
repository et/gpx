# Gpx

WIP
GPX is a `.gpx` parser.

## Usage

gpx = Gpx.parse('/path/to/file.gpx')
=> [%Gpx.Point{ele: 4.46, lat: 47.644548, lon: -122.326897}
   ...]

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
