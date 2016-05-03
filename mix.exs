defmodule Stem.Mixfile do
  use Mix.Project

  @target System.get_env("NERVES_TARGET") || "rpi2"

  def project do
    [app: :stem,
     version: "0.1.0",
     archives: [nerves_bootstrap: "~> 0.1"],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     target: @target,
     deps_path: "deps/#{@target}",
     build_path: "_build/#{@target}",
# causes silent ignore of config.exs replaced with import_config there
# config_path: "config/#{@target}/config.exs",
     aliases: aliases,
     deps: deps]
  end

  def application do
    [applications: [:nerves, :nerves_networking, :nerves_firmware, :logger], mod: {Stem, []}]
  end

  defp deps, do: [
    {:nerves, github: "nerves-project/nerves", branch: "mix"},
    {:nerves_networking, github: "nerves-project/nerves_networking"},
    {:nerves_firmware, github: "ghitchens/nerves_firmware"},
    {:"nerves_system_#{@target}", github: "nerves-project/nerves_system_#{@target}"},
  ]

  # nerves build magic
  def aliases, do: [
    "deps.precompile": ["nerves.precompile", "deps.precompile"],
    "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]
  ]

end