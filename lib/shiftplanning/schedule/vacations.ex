defmodule Shiftplanning.Schedule.Vacations do
  import Shiftplanning.Base, only: [request: 1]

  defp _get(mode, token) do
    payload = %{token: token,
                request: %{module: "schedule.vacations",
                           method: "GET",
                           mode: mode}}
    request(payload)
  end

  def get do
    get(:manage, Shiftplanning.Cache.Token.cached)
  end

  def get(mode) do
    get(mode, Shiftplanning.Cache.Token.cached)
  end

  def get(:manage, token) do
    _get("manage", token)
  end

  def get(:requested, token) do
    _get("requested", token)
  end

  def get(:upcoming, token) do
    _get("upcoming", token)
  end
end
