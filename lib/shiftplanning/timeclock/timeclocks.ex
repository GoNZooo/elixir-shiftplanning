defmodule Shiftplanning.Timeclock.Timeclocks do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(token) do
    payload = %{token: token,
                request: %{module: "timeclock.timeclocks",
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
