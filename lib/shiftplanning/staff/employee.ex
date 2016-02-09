defmodule Shiftplanning.Staff.Employee do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(eid, token) do
    payload = %{token: token,
                request: %{module: "staff.employee",
                           eid: eid,
                           method: "GET"}}
    request(payload)
  end

  def get(eid) do
    _get(eid, Token.cached)
  end
end
