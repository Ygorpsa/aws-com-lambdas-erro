# nodejs-ms-boilerplate
A nodejs microservice boilerplate with AWS infrastructure as code included!

### Provisioning the infrastructure
```
cd iac
export AWS_PROFILE=<profile name>
export ENV_NAME=<environment short name, like "dev" or "prd">
terragrunt apply
```

## Running locally

### Start mysql server:
```
docker network create groove
docker run --network groove \
  --name mysql \
  -ti \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=my_database \
  mysql
```

### Starting the API:
```
sam local start-api --env-vars sam-environment.json --docker-network groove
```