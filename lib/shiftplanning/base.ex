defmodule Shiftplanning.Base do
  alias Shiftplanning.Defaults

  @spec request(map) :: map
  def request(payload) do
    request(payload, Defaults.headers, Defaults.api_url)
  end

  @spec request(%{request: %{module: String.t,
                             method: String.t}},
                [{String.t, String.t}],
                String.t) :: map
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

  @spec request(map, [{String.t, String.t}], String.t) :: map
  def request(payload, headers, api_url) do
    encoded_payload = "data=#{Poison.encode!(payload)}"
    response = HTTPoison.post!(api_url, encoded_payload, headers)
    %HTTPoison.Response{body: body} = response
    data = %{"status" => 1} = Poison.decode!(body)
    data["data"]
  end
end
