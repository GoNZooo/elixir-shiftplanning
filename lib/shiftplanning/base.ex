defmodule Shiftplanning.Base do
  alias Shiftplanning.Defaults

  def request(payload) do
    request(payload, Defaults.headers, Defaults.api_url)
  end

  def request(payload = %{request: %{module: "staff.login",
                                     method: "GET"}},
              headers,
              api_url) do
    encoded_payload = "data=#{Poison.encode!(payload)}"
    response = HTTPoison.post!(api_url, encoded_payload, headers)
    %HTTPoison.Response{body: body} = response
    data = %{"status" => 1} = Poison.decode!(body)
    data["token"]
  end

  def request(payload, headers, api_url) do
    encoded_payload = "data=#{Poison.encode!(payload)}"
    response = HTTPoison.post!(api_url, encoded_payload, headers)
    %HTTPoison.Response{body: body} = response
    data = %{"status" => 1} = Poison.decode!(body)
    data["data"]
  end
end
