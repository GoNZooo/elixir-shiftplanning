defmodule Shiftplanning.Reports.Schedule do
  import Shiftplanning.Base, only: [request: 1]

  defp get(start_date, end_date, type,
           token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "reports.schedule",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           type: type}}
    request(payload)
  end

  def get_schedule_summary(start_date, end_date) do
    get(start_date, end_date, "schedule_summary")
  end

  def get_shift_confirmed(start_date, end_date) do
    get(start_date, end_date, "shift_confirmed")
  end

  def get_crib_sheet(start_date, end_date) do
    get(start_date, end_date, "crib_sheet")
  end

  def get_shift_exchanges(start_date, end_date) do
    get(start_date, end_date, "shift_exchanges")
  end
end
