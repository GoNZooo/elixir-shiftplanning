defmodule Shiftplanning.Cache.Token do
  @spec start_link :: {:ok, pid}
  def start_link do
    Agent.start_link(fn -> Shiftplanning.Staff.Login.get end, name: __MODULE__)
  end

  @spec cached :: String.t
  def cached do
    Agent.get(__MODULE__, fn token -> token end)
  end
end
