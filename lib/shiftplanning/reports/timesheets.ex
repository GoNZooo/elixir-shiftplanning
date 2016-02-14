defmodule Shiftplanning.Reports.Timesheets do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(type, start_date, end_date, token) do
    payload = %{token: token,
                request: %{module: "reports.timesheets",
                           start_date: start_date,
                           end_date: end_date,
                           type: type,
                           method: "GET"}}
    request(payload)
  end

  def get(start_date, end_date) do
    get("timesheets_summary", start_date, end_date, Token.cached)
  end

  def get(:timesheets_summary, start_date, end_date) do
    get("timesheets_summary", start_date, end_date, Token.cached)
  end

  def get(:timesheets_attendance, start_date, end_date) do
    get("timesheets_attendance", start_date, end_date, Token.cached)
  end

  def get(type, start_date, end_date, token) do
    _get(type, start_date, end_date, token)
  end
end
