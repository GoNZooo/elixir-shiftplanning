defmodule Shiftplanning.Location.Location do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(id, token) do
    payload = %{token: token,
                request: %{module: "location.location",
                           id: id,
                           method: "GET"}}
    request(payload)
  end

  def get(id) do
    get(id, Token.cached)
  end

  def get(id, token) do
    _get(id, token)
  end
end
