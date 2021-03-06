#!/bin/bash
source loadtest.env && \
echo "Building loads-broker.json" && \
cat > loads-broker.json <<EOF
{
  "name": "Shavar Server Testing",
  "plans": [

    {
      "name": "shavar: 4x node attack cluster",
      "description": "4 boxes",
      "steps": [
        {
          "name": "Shavar: Test Cluster",
          "instance_count": 4,
          "instance_region": "us-east-1",
          "instance_type": "m3.medium",
          "run_max_time": 600,
          "container_name": "rpappalax/shavar-loadtests:latest",
          "environment_data": [
            "URL_SERVER=https://shavar.stage.mozaws.net/downloads",
            "VERBOSE=",
            "CONNECTIONS=100",
            "TEST_DURATION=600"
          ],
          "volume_mapping": "/var/log:/var/log/$RUN_ID:rw",
          "docker_series": "shavar_loadtests"
        }
      ]
    }
  ]
}
EOF
