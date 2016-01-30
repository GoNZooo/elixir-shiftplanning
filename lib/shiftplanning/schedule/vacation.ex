defmodule Shiftplanning.Schedule.Vacation do
  import Shiftplanning.Base, only: [request: 1]

  def get(start_date, end_date, id,
          token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "schedule.vacation",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           id: id}}
    request(payload)
  end
end
