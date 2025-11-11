FROM arm64v8/ros:foxy-ros-base-focal

# --- 1. 기본 환경 변수 설정 (가장 변하지 않는 부분) ---
# RUN 명령어보다 먼저 ENV를 선언하는 것이 좋습니다.
# 이 환경 변수들은 이후 실행되는 모든 RUN 명령어에 적용됩니다.
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# (추가) OpenGL 간접 렌더링을 활성화하여 libGL 오류 해결
ENV LIBGL_ALWAYS_INDIRECT=1
# (추가) 시간대를 Asia/Seoul로 설정
ENV TZ=Asia/Seoul

# --- 2. 핵심 의존성 설치 (가장 느리고, 변하지 않는 부분) ---
# ros-desktop과 locales는 OS 기본 설정이므로 한 레이어로 묶습니다.
# 이 줄이 수정되지 않는 한, 이 레이어는 항상 캐시됩니다.
RUN apt-get update && apt-get install -y \
    ros-foxy-desktop \
    locales \
    tzdata \
 && locale-gen en_US.UTF-8 \
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo $TZ > /etc/timezone \
 && rm -rf /var/lib/apt/lists/*

# --- 3. (권장) 추가 도구 설치 (자주 변경될 수 있는 부분) ---
RUN apt-get update && apt-get install -y \
    x11-apps \
    git \
    python3-pip \
    vim \
    tree \
    sudo \
    python3-colcon-common-extensions\
 && rm -rf /var/lib/apt/lists/*

# rosdep: 다른 ROS 패키지의 의존성을 설치할 때 필수
RUN rosdep update

# --- 4. (신규) 사용자 생성 및 sudo 권한 부여 ---
# 'eogus'라는 사용자를 생성하고, -m 옵션으로 /home/eogus 디렉터리를 생성합니다.
RUN useradd -m --shell /bin/bash eogus

# 'eogus' 사용자를 'sudo' 그룹에 추가합니다.
RUN usermod -aG sudo eogus

# 'eogus' 사용자가 컨테이너 내부에서 비밀번호 없이 sudo를 사용할 수 있도록 설정합니다.
RUN echo "eogus ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/eogus-nopasswd

# --- 5. 사용자 설정 (비교적 자주 변경될 수 있는 부분) ---
# .bashrc 설정 등 사용자 정의 설정은 맨 마지막에 둡니다.
# RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# 기존 '~/.bashrc'는 /root/.bashrc에 저장되었습니다.
# 이제 'eogus' 사용자의 홈 디렉터리에 ROS 설정을 추가합니다.
RUN echo "source /opt/ros/foxy/setup.bash" >> /home/eogus/.bashrc
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /home/eogus/.bashrc

# --- 6. (신규) 기본 사용자 전환 ---
# Dockerfile의 이 지점부터 모든 명령어는 'eogus' 사용자로 실행됩니다.
# 컨테이너 실행 시 기본 사용자도 'eogus'가 됩니다.
USER eogus

# --- 7. (신규) 작업 디렉터리 설정 ---
# 컨테이너 접속 시 기본 경로를 /home/eogus로 설정합니다.
WORKDIR /home/eogus

# --- 8. 컨테이너 기본 명령어 ---
CMD ["/bin/bash"]