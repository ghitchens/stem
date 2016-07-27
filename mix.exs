defmodule Stem.Mixfile do
  use Mix.Project

  @target System.get_env("NERVES_TARGET") || "rpi"

  def project do
    [app: :stem,
      version: "0.2.0",
      elixir: "~> 1.3",
      archives: [nerves_bootstrap: "~> 0.1.3"],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      target: @target,
      deps_path: "deps/#{@target}",
      build_path: "_build/#{@target}",
      aliases: aliases(),
      deps: deps() ++ system(@target)]
  end

  def application, do: [
    mod: {Stem, []},
    applications: [:nerves, :logger, :nerves_networking, :nerves_cell]
  ]

  defp deps, do: [
    {:nerves, "~> 0.3.0"},
    {:nerves_networking, github: "nerves-project/nerves_networking"},
    {:nerves_cell, github: "ghitchens/nerves_cell"}
  ]

  def system(target), do:  [
     {:"nerves_system_#{target}", "~> 0.6"}
  ]

  # nerves build magic
  def aliases, do: [
    "deps.precompile": ["nerves.precompile", "deps.precompile"],
    "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]
  ]

end