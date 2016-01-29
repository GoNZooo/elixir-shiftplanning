defmodule Shiftplanning.Base do
  def request(payload) do
    request(payload,
            Shiftplanning.Defaults.headers,
            Shiftplanning.Defaults.api_url)
  end
  def request(payload = %{request: %{module: "staff.login",
                                     method: "GET"}},
              headers,
              api_url) do
    %HTTPoison.Response{body: body} = HTTPoison.post!(api_url,
                                                      "data=#{Poison.encode!(payload)}",
                                                      headers)
    data = %{"status" => 1} = Poison.decode!(body)
    data["token"]
  end

  def request(payload,
              headers,
              api_url) do
    %HTTPoison.Response{body: body} = HTTPoison.post!(api_url,
                                                      "data=#{Poison.encode!(payload)}",
                                                      headers)
    data = %{"status" => 1} = Poison.decode!(body)
    data["data"]
  end
end
