defmodule Shiftplanning.Timeclock.Timeclocks do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(token) do
    payload = %{token: token,
                request: %{module: "timeclock.timeclocks",
                           method: "GET"}}
    request(payload)
  end

  defp _get(%{schedule: schedule}, token) do
    payload = %{token: token,
                request: %{module: "timeclock.timeclocks",
                           method: "GET",
                           schedule: schedule}}
    request(payload)
  end

  def get do
    get(Token.cached)
  end

  def get(token) do
    _get(token)
  end

  def get(%{schedule: schedule}) do
    get(%{schedule: schedule}, token)
  end

  def get(%{schedule: schedule}, token) do
    _get(%{schedule: schedule}, token)
  end
end
