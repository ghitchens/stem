defmodule Stem do
  use Application
  require Logger

  @project Mix.Project.config
  @config  Application.get_env(:nerves, :project)

  def start(_type, _args) do
    Logger.info "Project: #{inspect @project}"
    Logger.info "Config: #{inspect @config}"
    Nerves.Networking.setup :eth0
    {:ok, self}
  end
end
