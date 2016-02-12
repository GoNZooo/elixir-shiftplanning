defmodule Shiftplanning.Staff.Skills do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(token) do
    payload = %{token: token,
                request: %{module: "staff.skills",
                           method: "GET"}}
    request(payload)
  end

  def get do
    get(Token.cached)
  end

  def get(token) do
    _get(token)
  end
end
