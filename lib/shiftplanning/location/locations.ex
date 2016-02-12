defmodule Shiftplanning.Location.Locations do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(type, token) do
    payload = %{token: token,
                request: %{module: "location.locations",
                           type: type,
                           method: "GET"}}
    request(payload)
  end

  def get do
    get(1, Token.cached)
  end

  def get(type) do
    get(type, Token.cached)
  end

  def get(type, token) do
    _get(type, token)
  end
end
