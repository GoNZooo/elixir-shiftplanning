defmodule Shiftplanning.Schedule.Shifts do
  import Shiftplanning.Base, only: [request: 1]

  def get_overview(start_date, end_date,
                   token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "schedule.shifts",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           mode: "overview"}}

    request(payload)
  end
end