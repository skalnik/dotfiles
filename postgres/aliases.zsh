alias postgres-up='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres-down='pg_ctl -D /usr/local/var/postgres stop -s -m fast'