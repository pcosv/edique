json.extract! task, :id, :name, :description, :final_date, :task_report, :created_at, :updated_at
json.url task_url(task, format: :json)
