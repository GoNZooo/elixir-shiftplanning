defmodule Shiftplanning.Base do
  def request(payload,
              headers \\ Shiftplanning.Defaults.headers,
              api_url \\ Shiftplanning.Defaults.api_url) do
    HTTPoison.post!(api_url, "data=#{Poison.encode!(payload)}", headers)
  end
end
