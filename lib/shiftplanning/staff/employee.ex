defmodule Shiftplanning.Staff.Employee do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  @spec _get(integer, String.t) :: map
  defp _get(eid, token) do
    payload = %{token: token,
                request: %{module: "staff.employee",
                           eid: eid,
                           method: "GET"}}
    request(payload)
  end

  @spec get(integer) :: map
  def get(eid) do
    get(eid, Token.cached)
  end

  @spec get(integer, String.t) :: map
  def get(eid, token) do
    _get(eid, token)
  end
end
