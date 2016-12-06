# docker-load-postgis
A container to load PostgreSQL database dumps with GIS data.

Please only use it in development, since unsave settings have been made for authentication and connectivity. For connecting, the default user is "*postgres*" and password "*postgres*". The default password can be changed in the build file: ``Dockerfile`` > ``POSTGRES_PW``

The container will **not** save your changes on the database. Its sole purpose is to load an empty or locally saved database file.

---

### Usage

Starting an empty database with GIS support:

```
docker run -p 5432:5432 --rm -it newtork/load-postgis
```

Starting the database with auto-restoring your files from a local backup directory:

```
docker run -p 5432:5432 --rm -it -v /local/database/dumps/:/restore newtork/load-postgis
```
