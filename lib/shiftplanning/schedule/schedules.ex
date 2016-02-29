defmodule Shiftplanning.Schedule.Schedules do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  @spec _get(1 | 0, String.t) :: map()
  defp _get(perms, token) do
    payload = %{token: token,
                request: %{module: "schedule.schedules",
                           perms: perms,
                           method: "GET"}}
    request(payload)
  end

  @spec get(1 | 0) :: map()
  def get(perms) do
    get(perms, Token.cached)
  end

  @spec get(1 | 0, String.t) :: map()
  def get(perms, token) do
    _get(perms, token)
  end
end
