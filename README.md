## Computer Graphics - OpenGL, GLFW/GLM Project Template(C++)

Visual Studio Code에서 OpenGL, GLFW/GLM 사용 가능하게 만든 프로젝트 템플릿입니다.

### 요구 사항
- Homebrew
- GLFW (Homebrew)

```bash
# Homebrew 설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 의존성 설치
brew install glfw
```

### 빠른 시작
```bash
# 빌드
make            # 또는: make build

# 실행
make run        # 또는: ./src/build/app

# 정리
make clean
```

### 빌드 상세
- 실행 파일: `src/build/app`
- 오브젝트 디렉토리: `src/build/obj`
- 컴파일러: `clang++`
- 주요 플래그: `-std=c++20 -Wall -Wextra -Werror -Wconversion -Wshadow -g -DGL_SILENCE_DEPRECATION -DGLFW_INCLUDE_NONE`
- 포함 경로: `-I/opt/homebrew/include -Isrc`
- 링크 옵션: `-L/opt/homebrew/lib -Wl,-rpath,/opt/homebrew/lib`
- 라이브러리: `-lglfw -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo`

필요 시 `Makefile`의 `INCLUDES`/`LDFLAGS` 경로를 환경에 맞게 조절.

### 문제 해결
- 링커가 `glfw`를 찾지 못하면 Homebrew 경로가 맞는지 확인하세요.
  - Apple Silicon: `/opt/homebrew`
  - Intel: `/usr/local`
- 경로가 다르면 `Makefile`의 include/lib 경로를 해당 경로로 변경하세요.
- 여전히 실패하면 `brew reinstall glfw` 후 다시 빌드하십시오.

### 개발 참고
- 에디터가 참조하는 컴파일 플래그는 `compile_flags.txt`에 있습니다.
- 엔트리포인트: `src/main.cpp`
- 실행 타깃은 `make run`이 `make build` 후 `src/build/app`를 실행합니다.
