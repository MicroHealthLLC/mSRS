json.extract! department, :id, :plan_id, :is_locked, :strategic_description, :customer_description, :internal_description, :learning_description, :created_at, :updated_at
json.url department_url(department, format: :json)
