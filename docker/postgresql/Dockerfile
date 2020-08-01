#
# example Dockerfile for https://docs.docker.com/engine/examples/postgresql_service/
#

FROM ubuntu:16.04

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN echo "" > /dev/null
RUN apt-get update
RUN apt-get install -y wget ca-certificates lsb-release

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``11.3``.
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 11
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common
RUN apt-get install -y postgresql postgresql-client postgresql-contrib

# additional setup
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN apt-get update
RUN apt-get install -y postgresql-11-pgrouting postgresql-11-postgis-2.5-scripts  postgresql-11-postgis-2.5 gdal-bin

# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-11`` package when it was ``apt-get installed``
USER postgres
RUN mkdir -p /var/lib/postgresql/data
RUN chown postgres:postgres /var/lib/postgresql/data
RUN chmod 750 /var/lib/postgresql/data

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN   /etc/init.d/postgresql start 11 &&\
    psql -p5433 --command "CREATE USER breakit WITH SUPERUSER PASSWORD 'root'" &&\
    createdb -p5433 -O breakit breakit

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/11/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/11/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/11/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5433

# Add VOLUMEs to allow backup of config, logs and databases
#VOLUME  ["/var/log/postgresql", "/var/lib/postgresql/data"]

# custom config file
COPY postgresql.conf /etc/postgresql/11/main/postgresql.conf

# Set the default command to run when starting the container
USER postgres
CMD ["/usr/lib/postgresql/11/bin/postgres", "-D", "/var/lib/postgresql/11/main", "-c", "config_file=/etc/postgresql/11/main/postgresql.conf"]
