defmodule Shiftplanning.Reports.Budget do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(start_date, end_date, token) do
    payload = %{token: token,
                request: %{module: "reports.budget",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date}}
    request(payload)
  end

  def get(start_date, end_date) do
    get(start_date, end_date, Token.cached)
  end

  def get(start_date, end_date, token) do
    _get(start_date, end_date, token)
  end
end
