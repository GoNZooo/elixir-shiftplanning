defmodule Shiftplanning.Schedule.ShiftRequests do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(shift, token) do
    payload = %{token: token,
                request: %{module: "schedule.shiftrequests",
                           method: "GET",
                           shift: shift}}
    request(payload)
  end

  def get(shift) do
    get(shift, Token.cached)
  end

  def get(shift, token) do
    _get(shift, token)
  end
end
