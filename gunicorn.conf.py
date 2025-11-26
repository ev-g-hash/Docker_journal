# Конфигурация Gunicorn для продакшена
bind = "0.0.0.0:8000"
workers = 3
worker_class = "sync"
worker_connections = 1000
timeout = 120
keepalive = 5
max_requests = 1000
max_requests_jitter = 100
preload_app = True
accesslog = "-"
errorlog = "-"
loglevel = "info"

# Указываем модуль настроек
raw_env = ['DJANGO_SETTINGS_MODULE=project.settings']