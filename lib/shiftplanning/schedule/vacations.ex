defmodule Shiftplanning.Schedule.Vacations do
  import Shiftplanning.Base, only: [request: 1]

  def get(start_date, end_date, mode,
          token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "schedule.vacations",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           mode: mode}}
    request(payload)
  end

  def get_manage(start_date, end_date,
                 token \\ Shiftplanning.Cache.Token.cached) do
    get(start_date, end_date, "manage", token)
  end

  def get_requested(start_date, end_date,
                 token \\ Shiftplanning.Cache.Token.cached) do
    get(start_date, end_date, "requested", token)
  end

  def get_upcoming(start_date, end_date,
                 token \\ Shiftplanning.Cache.Token.cached) do
    get(start_date, end_date, "upcoming", token)
  end
end
