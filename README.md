# sossbar 기획·디자인 도우미

> 웹 서비스의 **기획서, IA, 유저 플로우, 화면 요구사항, 리서치 계획, 디자인 시스템, 화면 명세**를 AI가 정해진 형식과 순서로 만들어 주는 도구 모음입니다.
> 개발 지식이 없어도 괜찮습니다. 설치한 뒤에는 평소 말투로 요청하면 됩니다.

## 목차

1. [시작 전에 확인하기](#1-시작-전에-확인하기)
2. [Claude에 설치하기](#2-claude에-설치하기)
3. [Codex에 설치하기](#3-codex에-설치하기)
4. [사용하기](#4-사용하기)
5. [업데이트하기](#5-업데이트하기)

---

## 1. 시작 전에 확인하기

**어떤 AI 도구를 쓰시나요?** 쓰는 도구에 맞는 순서만 따라 하면 됩니다.

| 쓰는 도구                                          | 따라 할 순서 |
| -------------------------------------------------- | ------------ |
| Claude (Claude 데스크톱 앱의 Code 탭, Claude Code) | 2번 → 4번    |
| Codex (ChatGPT 데스크톱 앱의 Codex, Codex CLI)     | 3번 → 4번    |

> 💡 **터미널이 처음이어도 괜찮습니다.** 설치 명령어는 둘 중 편한 방법으로 실행하세요.
>
> - **AI에게 부탁하기 (추천)**: Claude나 Codex 입력창에 "터미널에서 아래 명령어를 실행해줘"라고 쓰고, 명령어를 붙여 넣습니다.
> - **직접 실행하기**: Mac에서 `Command + Space`를 누르고 "터미널"을 검색해 엽니다. 명령어를 붙여 넣고 `Enter`를 누릅니다.

---

## 2. Claude에 설치하기

### 1단계 · 마켓플레이스 등록 (처음 한 번만)

```bash
claude plugin marketplace add D5ng/sossbar-ai-exercise
```

✔ `Successfully added marketplace: sossbar-ai`가 보이면 성공입니다.

### 2단계 · 플러그인 설치

```bash
claude plugin install sossbar@sossbar-ai
```

✔ `Successfully installed plugin: sossbar@sossbar-ai`가 보이면 성공입니다.

### 3단계 · Claude 다시 시작

Claude를 완전히 종료했다가 다시 엽니다.

**설치 확인**: 입력창에 `/`를 입력했을 때 `sossbar:`로 시작하는 항목이 보이면 끝입니다.
플러그인을 켜고 끄거나 삭제하려면 입력창 옆 **+ → Plugins**를 누릅니다.

---

## 3. Codex에 설치하기

### 1단계 · 마켓플레이스 등록 (처음 한 번만)

```bash
codex plugin marketplace add D5ng/sossbar-ai-exercise
```

✔ ``Added marketplace `sossbar-ai` ``가 보이면 성공입니다.

### 2단계 · 플러그인 설치

```bash
codex plugin add sossbar@sossbar-ai
```

✔ ``Added plugin `sossbar` from marketplace `sossbar-ai` ``가 보이면 성공입니다.

### 3단계 · 에이전트 복사 (Codex만 필요)

Codex는 플러그인 안의 에이전트를 자동으로 불러오지 않습니다. 아래 명령어로 에이전트 설정을 Codex 폴더에 복사합니다.

```bash
mkdir -p ~/.codex/agents && cp ~/.codex/plugins/cache/sossbar-ai/sossbar/*/.codex/agents/*.toml ~/.codex/agents/
```

> Windows를 쓰신다면 이 명령어 대신 Codex에게 "sossbar 플러그인의 `.codex/agents` 파일들을 `~/.codex/agents`로 복사해줘"라고 부탁하세요.

### 4단계 · 새 세션 시작

Codex에서 새 세션(새 대화)을 시작합니다.

**설치 확인**: 아래 명령어 결과에 `sossbar@sossbar-ai`와 `installed, enabled`가 보이면 끝입니다.

```bash
codex plugin list
```

> ⚠️ **Codex는 에이전트를 스스로 부르지 않습니다.** 에이전트가 필요하면 이름을 넣어 요청하세요.
> 예: "product-manager 에이전트로 기획해줘"

---

## 4. 사용하기

작업할 폴더를 연 뒤, 평소 말투로 요청하면 됩니다.

### 이렇게 요청해 보세요

| 하고 싶은 일         | 요청 예시                                                           |
| -------------------- | ------------------------------------------------------------------- |
| 서비스 전체 기획     | "1인 가구 직장인을 위한 반려동물 산책 대행 서비스 기획해줘"         |
| 필요한 문서만 작성   | "기획서만 먼저 써줘", "IA 짜줘", "회원 탈퇴 화면 규칙 추가해줘"      |
| 인터뷰 준비          | "AS-01 가정을 검증할 인터뷰 질문지 만들어줘"                        |
| 인터뷰 결과 정리     | "인터뷰 메모 정리해줘" + 메모 파일 첨부                             |
| 사용성 테스트        | "가입 흐름 사용성 테스트 계획 세워줘"                               |
| 디자인 시스템        | "이 기획으로 디자인 시스템 만들어줘"                                |
| 화면 설계            | "SCR-03 화면 와이어프레임 그려줘"                                   |
| 시안 제작            | "Figma로 시안 만들어줘" (Figma 연결 필요)                           |

> 💡 "experiments/우리서비스 폴더에 만들어줘"처럼 저장 위치를 정하면 다른 결과와 섞이지 않습니다.

### 작업은 이런 순서로 진행돼요

```text
기획 ─ 서비스 기획서 → IA → 유저 플로우 → 화면 요구사항 정의서
│
├─ 리서치 (선택) ─ 인터뷰로 가정 검증 · 사용성 테스트로 설계 검증
│
▼
디자인 ─ 디자인 브리프 → UX 라이팅 → 디자인 토큰 → 컴포넌트
       → UI 명세 · 와이어프레임 → 시안 → 접근성 검토 → 개발 인계 → 디자인 검토
```

### 문서에 보이는 표시

| 표시      | 뜻                               | 할 일                  |
| --------- | -------------------------------- | ---------------------- |
| 사실      | 자료나 근거가 있는 내용          | -                      |
| 가정      | 아직 검증되지 않은 임시 내용     | 필요하면 리서치로 검증 |
| 결정 필요 | 선택에 따라 결과가 달라지는 항목 | **답해 주세요**        |
| 확정      | 팀이 결정한 내용                 | -                      |

문서끼리는 번호로 연결됩니다. 문제 `P-01`, 목표 `G-01`, 가정 `AS-01`, 화면 `SCR-01`, 흐름 `F-01`, 화면 규칙 `SCR-01-R01`, 사용성 문제 `UT-01`, 반영 제안 `REC-01`.

### 꼭 알아 둘 약속

- AI는 모르는 내용을 지어내지 않고 **"결정 필요"**로 표시합니다. 표시된 질문에 답해 주세요.
- 인터뷰와 사용성 테스트는 사람이 진행합니다. AI는 계획을 세우고, 넘겨받은 기록을 분석합니다.
- 분석 결과는 "제안"으로 나옵니다. "REC-01 반영해줘"처럼 채택한 것만 문서에 반영됩니다.
- 인터뷰 메모를 넘길 때는 실명과 연락처를 지워 주세요.

---

## 5. 업데이트하기

담당자가 업데이트를 알리면 쓰는 도구에 맞게 실행한 뒤, 앱을 다시 시작하세요.

### Claude

```bash
claude plugin marketplace update sossbar-ai
claude plugin update sossbar@sossbar-ai
```

### Codex

```bash
codex plugin marketplace upgrade sossbar-ai
```

그다음 [3단계 · 에이전트 복사](#3단계--에이전트-복사-codex만-필요) 명령어를 한 번 더 실행합니다.

이전 버전을 설치했다면 이름이 바뀌거나 없어진 에이전트 파일이 남아 있으니 한 번 지워 주세요.

```bash
rm -f ~/.codex/agents/product-ui-designer.toml ~/.codex/agents/spec-reviewer.toml
```

> Windows를 쓰신다면 Codex에게 "`~/.codex/agents`에서 `product-ui-designer.toml`과 `spec-reviewer.toml`을 지워줘"라고 부탁하세요.

---

문의: [GitHub 저장소](https://github.com/D5ng/sossbar-ai-exercise) · 담당 D5ng
