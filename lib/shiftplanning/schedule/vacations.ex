defmodule Shiftplanning.Schedule.Vacations do
  import Shiftplanning.Base, only: [request: 1]

  defp _get(mode, token) do
    payload = %{token: token,
                request: %{module: "schedule.vacations",
                           method: "GET",
                           mode: mode}}
    request(payload)
  end

  @spec get :: map
  def get do
    get(:manage, Shiftplanning.Cache.Token.cached)
  end

  @spec get(String.t) :: map
  def get(mode) do
    get(mode, Shiftplanning.Cache.Token.cached)
  end

  @spec get(:manage, String.t) :: map
  def get(:manage, token) do
    _get("manage", token)
  end

  @spec get(:requested, String.t) :: map
  def get(:requested, token) do
    _get("requested", token)
  end

  @spec get(:upcoming, String.t) :: map
  def get(:upcoming, token) do
    _get("upcoming", token)
  end
end
