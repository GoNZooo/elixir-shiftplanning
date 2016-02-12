defmodule Shiftplanning.Payroll.Report do
  import Shiftplanning.Base, only: [request: 1]

  defp _get(eid, type, token) do
    payload = %{token: token,
                request: %{module: "payroll.report",
                           method: "GET",
                           employee: eid,
                           type: type}}
    request(payload)
  end

  defp _get(type, token) do
    payload = %{token: token,
                request: %{module: "payroll.report",
                           method: "GET",
                           type: type}}
    request(payload)
  end

  def get do
    get(:timesheet)
  end

  def get(:timesheet) do
    get("timesheet", Shiftplanning.Cache.Token.cached)
  end

  def get(:scheduledhours) do
    get("scheduledhours", Shiftplanning.Cache.Token.cached)
  end

  def get(:confirmedhours) do
    get("confirmedhours", Shiftplanning.Cache.Token.cached)
  end

  def get(%{eid: eid}, :timesheet) do
    _get(eid, "timesheet", Shiftplanning.Cache.Token.cached)
  end

  def get(type, token) do
    _get(type, token)
  end
end
