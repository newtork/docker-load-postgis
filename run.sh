#!/bin/bash

# check for data files to be restored
if [[ -e /restore && "$(ls /restore)" ]] ; then

		# wait for postgres server to accept connections
		until pg_isready -U postgres | grep "accepting connections" >/dev/null ; do
			/bin/sleep 0.1
			printf "."
		done
		
		# iterate over backup files
		for f in /restore/* ; do
			file="$(basename $f)"
			name=${file%.*}
			echo "Restoring $file..."
			createdb -U postgres --template=template0 --encoding=UNICODE "$name"
			pg_restore -U postgres -d "$name" $f
		done
fi &

# run postgres server as non-root
/bin/su - postgres -c "/usr/lib/postgresql/*/bin/postgres -D /etc/postgresql/*/main/"