defmodule Shiftplanning.Schedule.Shifts do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  @spec _get(String.t, String.t, String.t, String.t) :: map
  def _get(mode, start_date, end_date,
           token \\ Shiftplanning.Cache.Token.cached) do
    payload = %{token: token,
                request: %{module: "schedule.shifts",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           mode: mode}}

    request(payload)
  end

  @spec get(String.t, String.t) :: map
  def get(start_date, end_date) do
    get(:overview, start_date, end_date, Token.cached)
  end

  @spec get(:overview, String.t, String.t) :: map
  def get(:overview, start_date, end_date) do
    get(:overview, start_date, end_date, Token.cached)
  end

  @spec get(:confirm, String.t, String.t) :: map
  def get(:confirm, start_date, end_date) do
    get(:confirm, start_date, end_date, Token.cached)
  end

  @spec get(:overview, String.t, String.t, String.t) :: map
  def get(:overview, start_date, end_date, token) do
    _get("overview", start_date, end_date, token)
  end

  @spec get(:confirm, String.t, String.t, String.t) :: map
  def get(:confirm, start_date, end_date, token) do
    _get("confirm", start_date, end_date, token)
  end
end
