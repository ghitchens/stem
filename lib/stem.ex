defmodule Stem do
  use Application
  require Logger

  @fw_info Application.get_env(:nerves_firmware, :info, :unknown)

  def start(_type, _args) do
    Logger.info "Hello There!"
    Logger.info "Firmware: #{inspect @fw_info}"
    Nerves.Networking.setup :eth0
    {:ok, self}
  end
end