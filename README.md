##### Prerequisites
- Docker and Docker compose already installed

##### 1. Check out the repository

```bash
git clone git@github.com:jnmlima92/inventory-manager.git
```

##### 2. Create and setup the database

Run the following commands in application path to create and setup the database.

```bash
docker-compose build
docker-compose run --rm inventory-manager.web bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```bash
docker-compose up
```

And now you can visit the site with the URL http://localhost:3000

##### 4. Running tests

```bash
docker-compose run --rm inventory-manager.web rspec .
```
