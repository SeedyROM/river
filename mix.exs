defmodule River.Mixfile do
  use Mix.Project

  def project do
    [
      app: :river,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :mimimix],
      mod: {River.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.4.0"},
      {:mimimix, github: "SeedyROM/mimimix", only: :dev},
    ]
  end
end
