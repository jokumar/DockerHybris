docker rm hybris_sql
docker run --name hybris_sql -v my-datavolume:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_USER=admin -e MYSQL_DATABASE=isahybris -e MYSQL_PASSWORD=admin -d mysql:8.0
