defmodule Stem.Mixfile do
  use Mix.Project

  @target System.get_env("NERVES_TARGET") || "rpi"
  @architecture System.get_env("NERVES_ARCHITECURE") || "unknown"

  def project do
    [app: :stem,
     version: "0.2.0-pre",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     # App information
     product: "Generic Nerves Firmware",
     descripton: """
     Generic firmware for a Nerves device that implements the cell
     protocol set, so it can be discovered, updated, and managed over a
     network connection.
     """,
     author: "Garth Hitchens <ghitchens@me.com>",
     creation_date: (DateTime.utc_now |> DateTime.to_time),
     architecture: @architecture,
     target: @target,

     # Nerves build setup
     aliases: aliases(),
     archives: [nerves_bootstrap: "~> 0.1"],
     build_path: "_build/#{@target}",
     deps_path: "deps/#{@target}"]
  end

  def application do
    [applications: [:nerves, :nerves_networking, :nerves_firmware, :logger], 
     mod: {Stem, []}]
  end

  defp deps, do: [
    {:nerves, github: "nerves-project/nerves", branch: "mix"},
    {:nerves_networking, github: "nerves-project/nerves_networking"},
    {:nerves_firmware, github: "ghitchens/nerves_firmware"},
    {:"nerves_system_#{@target}", github: "nerves-project/nerves_system_#{@target}"},
  ]

  def aliases, do: [
    "deps.precompile": ["nerves.precompile", "deps.precompile"],
    "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]
  ]
end
