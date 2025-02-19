include .env

up_mariadb:
	docker compose --env-file .env up -d mariadb

down:
	docker compose --env-file .env down

to_mariadb:
	docker exec -it mariadb mariadb -u"${MARIADB_USER}" -p"${MARIADB_PASSWORD}" ${MARIADB_DATABASE}

to_mariadb_root:
	docker exec -it mariadb mariadb -u"root" -p"${MARIADB_ROOT_PASSWORD}" ${MARIADB_DATABASE}

mariadb_create:
	docker exec -it mariadb mariadb --local_infile -u"${MARIADB_USER}" -p"${MARIADB_PASSWORD}" ${MARIADB_DATABASE} -e"source /tmp/load_dataset/steam.sql"

mariadb_load:
	docker exec -it mariadb mariadb --local_infile -u"${MARIADB_USER}" -p"${MARIADB_PASSWORD}" ${MARIADB_DATABASE} -e"source /tmp/load_dataset/load_data.sql"