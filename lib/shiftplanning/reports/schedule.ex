defmodule Shiftplanning.Reports.Schedule do
  import Shiftplanning.Base, only: [request: 1]

  def get_shift_confirmed(start_date, end_date,
                          token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "reports.schedule",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           type: "shift_confirmed"}}
    request(payload)
  end

  def get_schedule_summary(start_date, end_date,
                           token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "reports.schedule",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           type: "schedule_summary"}}

    request(payload)
  end
end
