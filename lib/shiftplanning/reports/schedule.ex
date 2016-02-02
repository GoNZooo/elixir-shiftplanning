defmodule Shiftplanning.Reports.Schedule do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(start_date, end_date, type, token) do
    payload = %{token: token,
                request: %{module: "reports.schedule",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           type: type}}
    request(payload)
  end

  def get(start_date, end_date) do
    get(:schedule_summary, start_date, end_date, Token.cached)
  end

  def get(type, start_date, end_date) do
    get(type, start_date, end_date, Token.cached)
  end

  def get(:schedule_summary, start_date, end_date, token) do
    _get(start_date, end_date, "schedule_summary", token)
  end

  def get(:shift_confirmed, start_date, end_date, token) do
    _get(start_date, end_date, "shift_confirmed", token)
  end

  def get(:crib_sheet, start_date, end_date, token) do
    _get(start_date, end_date, "crib_sheet", token)
  end

  def get(:shift_exchanges, start_date, end_date, token) do
    _get(start_date, end_date, "shift_exchanges", token)
  end

  def get(:open_shifts, start_date, end_date, token) do
    _get(start_date, end_date, "open_shifts", token)
  end

  def get(:position_summary, start_date, end_date, token) do
    _get(start_date, end_date, "position_summary", token)
  end
end
