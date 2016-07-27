defmodule Stem do
  @moduledoc """
  A simple cell whose main purpose is to allow replacing it with
  a cell of a different type.
  """

  use Application
  require Logger

  @fw_info Application.get_env(:nerves_firmware, :info, :unknown)

  def start(_type, _args) do
    Logger.info "Hello There!"
    Logger.info "Firmware: #{inspect @fw_info}"
    Nerves.Networking.setup :eth0
    Nerves.Cell.setup
    {:ok, self}
  end
end