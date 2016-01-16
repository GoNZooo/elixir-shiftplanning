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
end
