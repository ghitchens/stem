defmodule Stem do
  @moduledoc """
  A simple cell whose main purpose is to allow replacing it with
  a cell of a different type.
  """

  use Application
  require Logger

  @project Mix.Project.config
  @config  Application.get_env(:nerves, :project)

  def start(_type, _args) do
    Logger.info "Nerves Stem Firmware, v#{@project[:version]} created #{@project[:creation_date] |> DateTime.to_iso8601}"
    Nerves.Networking.setup :eth0
    Nerves.Cell.setup
    spawn fn -> heartbeat end
    {:ok, self}
  end

  def heartbeat do
    Logger.info "Nerves Stem Firmware, v#{@project[:version]} created #{@project[:creation_date] |> DateTime.to_iso8601}"
    :timer.sleep 5000
    heartbeat
  end
end
