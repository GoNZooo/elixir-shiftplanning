defmodule Shiftplanning.Defaults do
  @type headers :: [{String.t, String.t}]
  def headers do
    [{"Accept", "application/json"},
    {"Content-Type", "application/x-www-form-urlencoded"}]
  end

  @type api_url :: String.t
  def api_url do
    "https://www.shiftplanning.com/api/"
  end
end
