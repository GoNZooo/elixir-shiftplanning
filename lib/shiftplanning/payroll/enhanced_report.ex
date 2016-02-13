defmodule Shiftplanning.Payroll.EnhancedReport do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(token) do
    payload = %{token: token,
                request: %{module: "payroll.enhancedreport",
                           method: "GET"}}
    request(payload)
  end

  def get do
    _get(Token.cached)
  end
end
