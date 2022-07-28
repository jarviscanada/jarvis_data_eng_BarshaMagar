#! /bin/sh

#capture CLI arguments
cmd=$1
db_username=$2
db_password=$3

#Start docker
sudo systemctl status docker || sudo systemctl start docker 
echo 'docker started'

#check container status
docker container inspect jrvs-psql 
container_status=$?
echo 'container status = '$container_status

#User switch case to handle create|stop|start options
case $cmd in
  create)
  # Check if the container is already created
  if [ $container_status -eq 0 ]; then
		echo 'Container already exists'
		exit 1
	fi

	#check # of CLI arguments
  if [ $# -ne 3 ]; then
    echo 'Create requires username and password'
    exit 1
  fi

  #Create container
	  docker volume create pgdata
	  export PGPASSWORD='password'
	  docker run --name jrvs-psql -e POSTGRES_PASSWORD=$PGPASSWORD -d -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:9.6-alpine
	  echo 'container created'
	  exit 0
	;;

  start)
 # check instance status; start container if it has been created, if not exit 1
  if [ $container_status -eq 0 ]; then
    docker container start jrvs-psql
    echo 'started container'
    exit 0
  else
    echo 'container has not been created'
    	  exit 1
	fi
	;;

  stop)
    # check status; if container exists, stop container, otherwise exit 1
    if [ $container_status -eq 0 ]; then
      docker container stop jrvs-psql
      echo 'container stopped'
      exit 0
      else
        echo 'container has not been created'
        	  exit 1
    fi
    ;;

  *)
	  echo 'Illegal command'
	  echo 'Commands: start|stop|create'
	  exit 1
	  ;;
<<<<<<< HEAD
esac
=======
esac
>>>>>>> 4442c99fbad11f16e5384044ec4c6f0eb0da0855
