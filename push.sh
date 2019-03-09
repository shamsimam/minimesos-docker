#!/bin/bash

if [ "${MINIMESOS_DOCKER_VERSION}" == "" ]
then
  echo "ERROR: Please set MINIMESOS_DOCKER_VERSION before building"
  exit 1
fi

echo INFO: Pushing twosigma/mesos-base:${MINIMESOS_DOCKER_VERSION}
docker push twosigma/mesos-base:${MINIMESOS_DOCKER_VERSION} || exit $?

pushImage() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  for role in agent master; do
    echo
    echo INFO: Pushing twosigma/mesos-${role}:${MESOS_VERSION}-${MINIMESOS_DOCKER_VERSION}
    docker push twosigma/mesos-${role}:${MESOS_VERSION}-${MINIMESOS_DOCKER_VERSION} || exit $?
  done

}

#            Mesos version  Mesosphere tag
pushImage "1.0.0"	  	  "2.0.86.ubuntu1604"
#pushImage "1.7.1"	  	  "2.0.1"
#pushImage "0.25.0"       "0.2.70.ubuntu1404"
#pushImage "0.26.0"       "0.2.145.ubuntu1404"
#pushImage "0.27.0"       "0.2.190.ubuntu1404"
#pushImage "0.27.1"       "2.0.226.ubuntu1404"
#pushImage "0.28.0"       "2.0.16.ubuntu1404"
#pushImage "0.28.1"       "2.0.20.ubuntu1404"
#pushImage "1.0.0"	  	 "2.0.89.ubuntu1404"
