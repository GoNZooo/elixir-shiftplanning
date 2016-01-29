defmodule Shiftplanning.Cache.Token do
  def start_link do
    Agent.start_link(fn -> Shiftplanning.Staff.Login.get end,
    name: __MODULE__)
  end

  def cached do
    Agent.get(__MODULE__, fn token -> token end)
  end
end
