defmodule Shiftplanning.Reports.Employee do
  import Shiftplanning.Base, only: [request: 1]
  alias Shiftplanning.Cache.Token

  defp _get(start_date, end_date, type, token) do
    payload = %{token: token,
                request: %{module: "reports.employee",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           type: type}}
    request(payload)
  end

  defp _get_eid(start_date, end_date, type, id, token) do
    payload = %{token: token,
                request: %{module: "reports.employee",
                           method: "GET",
                           start_date: start_date,
                           end_date: end_date,
                           type: type,
                           employee: id}}
    request(payload)
  end

  def get(start_date, end_date) do
    get(:attendance, start_date, end_date, Token.cached)
  end

  def get(start_date, end_date, [id: id]) do
    get(:attendance, start_date, end_date, [id: id], Token.cached)
  end

  def get(type, start_date, end_date) do
    get(type, start_date, end_date, Token.cached)
  end

  def get(type, start_date, end_date, [id: id]) do
    get(type, start_date, end_date, [id: id], Token.cached)
  end

  def get(:attendance, start_date, end_date, token) do
    _get(start_date, end_date, "attendance", token)
  end

  def get(:vacations, start_date, end_date, token) do
    _get(start_date, end_date, "vacations", token)
  end

  def get(:availability, start_date, end_date, token) do
    _get(start_date, end_date, "availability", token)
  end

  def get(:unavailability, start_date, end_date, token) do
    _get(start_date, end_date, "unavailability", token)
  end

  def get(:hourly_availability, start_date, end_date, token) do
    _get(start_date, end_date, "hourly-availability", token)
  end

  def get(:vacation_summary, start_date, end_date, token) do
    _get(start_date, end_date, "vacation-summary", token)
  end

  def get(:attendance, start_date, end_date, [id: id], token) do
    _get_eid(start_date, end_date, "attendance", id, token)
  end

  def get(:vacations, start_date, end_date, [id: id], token) do
    _get_eid(start_date, end_date, "vacations", id, token)
  end

  def get(:availability, start_date, end_date, [id: id], token) do
    _get_eid(start_date, end_date, "availability", id, token)
  end

  def get(:unavailability, start_date, end_date, [id: id], token) do
    _get_eid(start_date, end_date, "unavailability", id, token)
  end

  def get(:hourly_availability, start_date, end_date, [id: id], token) do
    _get_eid(start_date, end_date, "hourly-availability", id, token)
  end

  def get(:vacation_summary, start_date, end_date, [id: id], token) do
    _get_eid(start_date, end_date, "vacation-summary", id, token)
  end
end
