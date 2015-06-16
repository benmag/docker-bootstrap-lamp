## docker-bootstrap-lamp

This is an image containing the LAMP stack which is wired up to our data container (bootstrap-data). Tutum has a good LAMP image with most of the things we want set up and installed so we are using that as a starting point.

Run it (expose ports, link it to the data container): 
```
docker run --name bootstrap-lamp --privileged=true --volumes-from bootstrap-data -p 80:80 -p 3306:3306 -d benmag/bootstrap-lamp
```

Build it (if you've made changes to this Dockerfile):
```
docker build -t benmag/bootstrap-lamp .
```
