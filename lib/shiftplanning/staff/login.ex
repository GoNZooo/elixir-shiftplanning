defmodule Shiftplanning.Staff.Login do
  import Shiftplanning.Base, only: [request: 1]

  def get(key \\ Application.get_env(:shiftplanning, :key),
          username \\ Application.get_env(:shiftplanning, :username),
          password \\ Application.get_env(:shiftplanning, :password)) do
    payload = %{key: key,
                request: %{module: "staff.login",
                           method: "GET",
                           username: username,
                           password: password}}
    request(payload)
  end
end
