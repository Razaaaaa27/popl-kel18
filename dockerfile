from nginx:alpine

# copy html php js files
copy *.html /usr/share/nginx/html/
copy *.php /usr/share/nginx/html/
copy *.js /usr/share/nginx/html/

# copy the sql script or mysql folder (optional)
copy ./database/*.sql /docker-entrypoint-initdb.d/

# expose nginx port
expose 80

# start nginx
cmd ["nginx", "-g", "daemon off;"]
