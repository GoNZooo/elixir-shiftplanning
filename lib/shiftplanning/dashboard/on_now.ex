defmodule Shiftplanning.Dashboard.OnNow do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(lateforwork, token) do
    payload = %{token: token,
                request: %{module: "dashboard.onnow",
                           lateforwork: lateforwork,
                           method: "GET"}}
    request(payload)
  end

  def get(lateforwork) do
    get(lateforwork, Token.cached)
  end

  def get(lateforwork, token) do
    _get(lateforwork, token)
  end
end
