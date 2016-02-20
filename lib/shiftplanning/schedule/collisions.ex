defmodule Shiftplanning.Schedule.Collisions do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(start_date, end_date, token) do
    payload = %{token: token,
                request: %{module: "schedule.collisions",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date}}
    request(payload)
  end

  def get(start_date, end_date) do
    get(start_date, end_date, Token.cached)
  end

  def get(start_date, end_date, token) do
    _get(start_date, end_date, token)
  end
end
