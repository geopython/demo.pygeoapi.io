#!/bin/bash
#
# This build all assets (mainly Docker images) for Admin Platform
# You must first have installed Docker, or better have run bootstrap.sh
#
# Just van den Broecke - 2017
#
script_name=${0##*/}
script_dir=${0%/*}
DOCKER_HOME=${script_dir}/../services
DOCKERS="home pygeoapi"

echo "=========================================="
echo "Starting Docker Build Process"
echo "Script: ${script_name}"
echo "Docker Home: ${DOCKER_HOME}"
echo "Services to build: ${DOCKERS}"
echo "=========================================="

for DOCK in ${DOCKERS}
do
  echo ""
  echo ">>> Building Docker service: ${DOCK}"
  echo ">>> Directory: ${DOCKER_HOME}/${DOCK}"
  echo ">>> Started at: $(date)"
  echo ""
  
  pushd ${DOCKER_HOME}/${DOCK}
  
  if [ -f "./build.sh" ]; then
    echo ">>> Executing build.sh for ${DOCK}..."
    ./build.sh
    build_status=$?
    if [ $build_status -eq 0 ]; then
      echo ">>> ✅ SUCCESS: ${DOCK} built successfully"
    else
      echo ">>> ❌ FAILED: ${DOCK} build failed with exit code $build_status"
    fi
  else
    echo ">>> ⚠️  WARNING: No build.sh found in ${DOCKER_HOME}/${DOCK}"
  fi
  
  popd
  echo ">>> Completed ${DOCK} at: $(date)"
  echo "----------------------------------------"
done

echo ""
echo "=========================================="
echo "All Docker builds completed"
echo "Finished at: $(date)"
echo "=========================================="
echo "READY"
