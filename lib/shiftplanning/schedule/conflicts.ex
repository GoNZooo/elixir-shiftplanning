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

  def get do
    get(Token.cached)
  end

  def get(token) do
    _get(token)
  end
end
