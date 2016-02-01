defmodule Shiftplanning.Schedule.Vacations do
  import Shiftplanning.Base, only: [request: 1]

  defp _get(start_date, end_date, mode, token) do
    payload = %{token: token,
                request: %{module: "schedule.vacations",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           mode: mode}}
    request(payload)
  end

  def get(start_date, end_date) do
    get(:manage, start_date, end_date, Shiftplanning.Cache.Token.cached)
  end

  def get(mode, start_date, end_date) do
    get(mode, start_date, end_date, Shiftplanning.Cache.Token.cached)
  end

  def get(:manage, start_date, end_date, token) do
    _get(start_date, end_date, "manage", token)
  end

  def get(:requested, start_date, end_date, token) do
    _get(start_date, end_date, "requested", token)
  end

  def get(:upcoming, start_date, end_date, token) do
    _get(start_date, end_date, "upcoming", token)
  end
end
