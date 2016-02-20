defmodule Shiftplanning.Schedule.Conflicts do
  @moduledoc"""
  # 2016-02-19
  This module seems like it should work, but it times out without any errors
  when you try to use it. The parameters don't really seem to matter.
  """
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(token) do
    payload = %{token: token,
                request: %{module: "schedule.conflicts",
                           method: "GET"}}
    request(payload)
  end

  defp _get(start_date, end_date, token) do
    payload = %{token: token,
                request: %{module: "schedule.conflicts",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date}}
    request(payload)
  end

  def get do
    get(Token.cached)
  end

  def get(token) do
    _get(token)
  end

  def get(start_date, end_date) do
    get(start_date, end_date, Token.cached)
  end

  def get(start_date, end_date, token) do
    _get(start_date, end_date, token)
  end
end
