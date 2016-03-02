defmodule Shiftplanning.Schedule.Shifts do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  @spec _get(String.t, String.t, String.t, String.t) :: map
  def _get(mode, start_date, end_date, token) do
    payload = %{token: token,
                request: %{module: "schedule.shifts",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           mode: mode}}

    request(payload)
  end

  @spec _get(String.t, String.t, String.t, String.t,
             %{employees: [String.t]}) :: map
  def _get(mode, start_date, end_date, token, %{employees: employees}) do
    payload = %{token: token,
                request: %{module: "schedule.shifts",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           employees: employees,
                           mode: mode}}

    request(payload)
  end

  @spec get(String.t, String.t) :: map
  def get(start_date, end_date) do
    get(:overview, start_date, end_date, Token.cached)
  end

  @spec get(:overview, String.t, String.t) :: map
  def get(:overview, start_date, end_date) do
    get(:overview, start_date, end_date, Token.cached)
  end

  @spec get(:confirm, String.t, String.t) :: map
  def get(:confirm, start_date, end_date) do
    get(:confirm, start_date, end_date, Token.cached)
  end

  @spec get(:location, String.t, String.t) :: map
  def get(:location, start_date, end_date) do
    get(:location, start_date, end_date, Token.cached)
  end

  @spec get(:schedule, String.t, String.t) :: map
  def get(:schedule, start_date, end_date) do
    get(:schedule, start_date, end_date, Token.cached)
  end

  @spec get(:incomplete, String.t, String.t) :: map
  def get(:incomplete, start_date, end_date) do
    get(:incomplete, start_date, end_date, Token.cached)
  end

  @spec get(:employees, String.t, String.t, %{employees: [String.t]}) :: map
  def get(:employees, start_date, end_date, %{employees: employees}) do
    get(:employees, start_date, end_date, Token.cached, %{employees: employees})
  end

  @spec get(:overview, String.t, String.t, String.t) :: map
  def get(:overview, start_date, end_date, token) do
    _get("overview", start_date, end_date, token)
  end

  @spec get(:confirm, String.t, String.t, String.t) :: map
  def get(:confirm, start_date, end_date, token) do
    _get("confirm", start_date, end_date, token)
  end

  @spec get(:location, String.t, String.t, String.t) :: map
  def get(:location, start_date, end_date, token) do
    _get("location", start_date, end_date, token)
  end

  @spec get(:schedule, String.t, String.t, String.t) :: map
  def get(:schedule, start_date, end_date, token) do
    _get("schedule", start_date, end_date, token)
  end

  @spec get(:incomplete, String.t, String.t, String.t) :: map
  def get(:incomplete, start_date, end_date, token) do
    _get("incomplete", start_date, end_date, token)
  end

  @spec get(:employees, String.t, String.t, String.t,
            %{employees: [String.t]}) :: map
  def get(:employees, start_date, end_date, token, %{employees: employees}) do
    employee_list = Enum.join(employees, ",")
    _get("employees", start_date, end_date, token, %{employees: employee_list})
  end
end
