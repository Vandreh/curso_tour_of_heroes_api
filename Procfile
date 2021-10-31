release: rails db:migrate
web: bundle exec puma -t 5:5 ${PORT:-3000} -e ${RACK_ENV:-development}