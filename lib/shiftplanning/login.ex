defmodule Shiftplanning.Login do
  import Shiftplanning.Base, only: [request: 1]

  def get(key \\ Application.get_env(:shiftplanning, :key),
          username \\ Application.get_env(:shiftplanning, :username),
          password \\ Application.get_env(:shiftplanning, :password),
          headers \\ Shiftplanning.Defaults.headers,
          api_url \\ Shiftplanning.Defaults.api_url) do
    payload = %{key: key,
                request: %{module: "staff.login",
                           method: "GET",
                           username: username,
                           password: password}}
    
    %HTTPoison.Response{body: body} = request(payload)
    response = Poison.decode!(body)
    response["token"]
  end
end
