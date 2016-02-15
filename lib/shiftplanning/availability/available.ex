defmodule Shiftplanning.Availability.Available do
  alias Shiftplanning.Cache.Token
  import Shiftplanning.Base, only: [request: 1]

  defp _get(start_date, token) do
    payload = %{token: token,
                request: %{module: "availability.available",
                           start_date: start_date,
                           method: "GET"}}
    request(payload)
  end

  defp _get(%{user: user}, start_date, token) do
    payload = %{token: token,
                request: %{module: "availability.available",
                           start_date: start_date,
                           user: user,
                           method: "GET"}}
    request(payload)
  end

  def get(start_date) do
    get(start_date, Token.cached)
  end

  def get(%{user: user}, start_date) do
    get(%{user: user}, start_date, Token.cached)
  end

  def get(start_date, token) do
    _get(start_date, token)
  end

  def get(%{user: user}, start_date, token) do
    _get(%{user: user}, start_date, token)
  end
end
