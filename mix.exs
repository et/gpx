defmodule Gpx.Mixfile do
  use Mix.Project

  @description """
  A GPX parsing library.
  """

  def project do
    [app: :gpx,
     version: "0.1.0",
     elixir: "~> 1.3",
     description: @description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:sweet_xml, "~> 0.6.2"}
    ]
  end

  defp package do
    [
      name: :gpx,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Eric Thomas"],
      licenses: ["MIT"],
      links: %{GitHub => "https://github.com/et/gpx"}
    ]
  end
end
