defmodule Stem.Mixfile do
  use Mix.Project

  @target System.get_env("NERVES_TARGET") || "rpi"
  @architecture System.get_env("NERVES_ARCHITECURE") || "unknown"

  def project do
    [app: :stem,
     version: "0.2.1-pre-6f",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,

     # App information
     product: "Nerves Stem Firmware",
     descripton: """
     Generic firmware for a Nerves device that implements the "Cell"
     protocol set, so it can be discovered, updated, and managed over a
     network connection.
     """,
     author: "Nerves Project http://nerves-project.org",
     tags: "development",
     creation_date: DateTime.utc_now,
     architecture: @architecture,
     target: @target,

     # Nerves build setup
     aliases: aliases(),
     archives: [nerves_bootstrap: "~> 0.1"],
     build_path: "_build/#{@target}",
     deps_path: "deps/#{@target}",
     deps: deps() ++ system(@target)]
  end

  def application, do: [
    mod: {Stem, []},
    applications: [:nerves, :logger, :nerves_networking, :nerves_cell, :logger_multicast_backend]
  ]

  defp deps, do: [
    {:nerves, "~> 0.3"},
    {:nerves_networking, "~> 0.6"},
    {:nerves_cell, github: "ghitchens/nerves_cell"},
    {:logger_multicast_backend, github: "ghitchens/logger_multicast_backend"}
  ]

  def system(target), do:  [
     {:"nerves_system_#{target}", "~> 0.6"}
  ]

  def aliases, do: [
    "deps.precompile": ["nerves.precompile", "deps.precompile"],
    "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]
  ]
end
