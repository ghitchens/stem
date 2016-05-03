defmodule Stem do
  use Application
  def start(_type, _args) do
    Nerves.Networking.setup :eth0
    {:ok, self}
  end
end