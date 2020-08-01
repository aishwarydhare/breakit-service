# Note

1. docker-compose volume binding doesn't work directly: it will throw error like PG_VERSION is missing etc
2. Hence on first run, first comment the line of the volume bind of data directory i.e. `- ./postgresql/data/:/var/lib/postgresql/11/main`
3. After commenting this line, run container again using docker-compose
4. Copy the generated files and folders from the container to host machine `docker cp psql:/var/lib/postgresql/11/main/. ./postgresql/data/`
5. Restart docker-compose by down and then up

