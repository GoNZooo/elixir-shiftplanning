defmodule Shiftplanning.Defaults do
  def headers do
    [{"Accept", "application/json"},
    {"Content-Type", "application/x-www-form-urlencoded"}]
  end

  def api_url do
    "https://www.shiftplanning.com/api/"
  end
end
