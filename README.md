# docker-load-postgis
A container to load PostgreSQL database dumps with GIS data.


# Usage

Starting an empty database with GIS support:

```
docker run -p 5432:5432 --rm -it newtork/load-postgis
```

Starting the database with auto-restoring your files from a local backup directory:

```
docker run -p 5432:5432 --rm -it -v /local/database/dumps/:/restore newtork/load-postgis
```
