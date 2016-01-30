defmodule Shiftplanning.Schedule.Vacations do
  import Shiftplanning.Base, only: [request: 1]

  def get(start_date, end_date,
          token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "schedule.vacations",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date}}
    request(payload)
  end
end
