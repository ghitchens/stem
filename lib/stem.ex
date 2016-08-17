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
    Logger.info "Project: #{inspect @project}"
    Logger.info "Config: #{inspect @config}"
    Nerves.Networking.setup :eth0
    Nerves.Cell.setup
    {:ok, self}
  end
end
