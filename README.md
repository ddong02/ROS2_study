# ROS (2025-2)

## 11주차 - 실습로봇소개

### NVIDIA Jetson Nano?
**NVIDIA Jetson Nano**는 엣지[^Edge] AI 애플리케이션을 위한 소형의 강력한 임베디드 컴퓨터로, 472 GFLOP의
고성능 처리능력을 제공하면서도 극히 낮은 전력 소비로 작동한다.

Jetson Nano는 5W 또는 10W의 동적 전력 모드로 작동하며, 이는 배터리 구동 로봇이나 IoT 디바이스에 이상적이다.

Jetson Nano는 다음과 같은 사양을 갖추고 있다.
- **GPU:** 128코어 NVIDIA Maxwell 아키텍처 GPU
- **CPU:** 1.43 GHz의 쿼드코어 ARM Cortex-A57 프로세서
- **Memory:** 4GB 64-bit LPDDR4 (25.6 GB/s 대역폭)
- **Video Encode:** 4K @ 30fps (H.264/H.265), 1x 4K @ 30 (HEVC), 2x 1080p @ 60 (HEVC)
- **Video Decode:** 4K @ 60fps (HEVC), 8x 1080p @ 30 (HEVC), 9x 720p @ 30

[^Edge]: 데이터 처리의 위치를 나타내는 개념으로 클라우드와 대비되는 개념이다.
    엣지 처리 방식이란 데이터를 수집한 그 자리에서, 즉 로컬 기기(엣지)에서 처리한다.

### Camera device in Linux?
Linux에서 카메라는 **Video4Linux2 (V4L2)** 서브시스템을 통해 관리되며, 가장 일반적인 장치 파일 이름은 다음과 같다.

1. 기본 장치 파일 이름
`/dev/videoN` (N은 0부터 시작하는 숫자)
- 첫 번째 카메라: `/dev/video0`
- 두 번째 카메라: `dev/video0`

2. 카메라 장치 확인
현재 시스템에 연결된 카메라의 정보를 확인하는 명령어
`$ ls -l /dev/video*`

### 

## 12주차 - ROS2_카메라1

### 1.

<img width="718" height="189" alt="image" src="https://github.com/user-attachments/assets/53b0cd7a-2616-4080-83e3-f4ed7fcd1718" />

<img width="657" height="89" alt="image" src="https://github.com/user-attachments/assets/43dddeb6-283d-4b12-9675-9d299f1168ba" />

### 2.

<img width="718" height="93" alt="image" src="https://github.com/user-attachments/assets/5b0b4717-77c4-4f01-9f76-8844cb696e41" />

<img width="721" height="94" alt="image" src="https://github.com/user-attachments/assets/71bdab39-052f-4cfb-b780-63990bd4ce15" />

## 12주차 - 
