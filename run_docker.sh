#!/bin/bash

# --- (1) 사용자 설정 ---
# 사용자가 빌드한 이미지 이름:태그를 여기에 입력하세요.
IMAGE_NAME="official_ros:foxy" 
CONTAINER_NAME="ros_foxy"
HOST_WS_PATH="/Users/eogus/Documents/ros2_docker/ros2_ws"
CONTAINER_WS_PATH="/home/eogus/ros2_ws"
# ---------------------

# 1. 컨테이너가 '실행 중(Up)'인지 확인
if [ "$(docker ps -q -f "name=^/${CONTAINER_NAME}$")" ]; then
    echo "✅ Attaching to running container: $CONTAINER_NAME"
    docker exec -it $CONTAINER_NAME /bin/bash

# 2. 컨테이너가 '중지(Exited)' 상태인지 확인
elif [ "$(docker ps -aq -f "status=exited" -f "name=^/${CONTAINER_NAME}$")" ]; then
    echo "🔄 Starting and attaching to stopped container: $CONTAINER_NAME"
    # XQuartz가 이미 실행 중이고 xhost가 설정되었다고 가정
    docker start -ai $CONTAINER_NAME

# 3. 컨테이너가 '존재하지 않음'
else
    echo "✨ Creating new container: $CONTAINER_NAME"
    
    # XQuartz 접근 허용 (최초 생성 시에만 필요)
    echo "Setting XQuartz permissions..."
    xhost +local:

    # 새 컨테이너 생성 및 실행
    docker run -it \
      --name $CONTAINER_NAME \
      -e DISPLAY=docker.for.mac.host.internal:0 \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v $HOST_WS_PATH:$CONTAINER_WS_PATH \
      $IMAGE_NAME
fi