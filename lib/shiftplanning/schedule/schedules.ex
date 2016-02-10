defmodule Shiftplanning.Schedule.Schedules do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(perms, token) do
    payload = %{token: token,
                request: %{module: "schedule.schedules",
                           perms: perms,
                           method: "GET"}}
    request(payload)
  end

  def get(perms) do
    _get(perms, Token.cached)
  end
end
