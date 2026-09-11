# sossbar — 기획·리서치·디자인 하네스

웹 서비스의 기획서, IA, 유저 플로우, 정책서, UX 리서치 계획, 디자인 시스템, UI 명세, 개발 인계 문서를 Claude가 **정해진 순서와 형식으로** 만들어 주는 Claude Code 스킬·에이전트 모음입니다. 개발 지식 없이 말로 요청하면 됩니다.

## 설치

### 방법 1. 플러그인으로 설치 (권장)

어느 프로젝트 폴더에서나 쓸 수 있고, 이 저장소가 바뀌면 업데이트만 받으면 됩니다.

1. 마켓플레이스를 등록합니다. 처음 한 번만 하면 됩니다.

   ```bash
   claude plugin marketplace add D5ng/sossbar-ai-exercise
   ```

2. 플러그인을 설치합니다.

   ```bash
   claude plugin install sossbar@sossbar-ai
   ```

3. Claude를 다시 시작합니다. 입력창에 `/`를 입력했을 때 `sossbar:`로 시작하는 스킬이 보이면 설치가 끝난 것입니다.

터미널이 익숙하지 않다면 Claude 데스크톱 앱의 Code 탭에서 Claude에게 "터미널에서 `claude plugin marketplace add D5ng/sossbar-ai-exercise` 실행해줘"라고 요청하면 대신 실행합니다. 설치한 뒤에는 입력창 옆 **+ → Plugins**에서 켜고 끄거나 삭제할 수 있습니다.

업데이트를 받을 때는 아래를 실행한 뒤 Claude를 다시 시작합니다.

```bash
claude plugin marketplace update sossbar-ai
claude plugin update sossbar@sossbar-ai
```

### 방법 2. 폴더를 그대로 열기

1. `git clone https://github.com/D5ng/sossbar-ai-exercise.git`으로 받거나, GitHub의 **Code → Download ZIP**으로 내려받습니다.
2. Claude 데스크톱 앱의 Code 탭에서 이 폴더를 엽니다.
3. 스킬이 보이지 않으면 Claude에게 "스킬 링크 다시 만들어줘"라고 요청합니다. `scripts/link-skills.sh`가 실행됩니다.

이 방법은 이 폴더 안에서만 쓸 수 있습니다. 방법 1과 함께 쓰면 같은 스킬이 두 번 보이므로 하나만 사용하세요.

## 이렇게 요청하세요

| 역할 | 요청 예시 |
| --- | --- |
| 기획 | "1인 가구 직장인을 위한 반려동물 산책 대행 서비스 기획해줘" |
| 기획 | "기획서만 먼저 써줘", "IA 짜줘", "정책서에 회원 탈퇴 규칙 추가해줘" |
| 기획 | "기획서가 빈약한데 뭘 더 넣으면 좋을까?" |
| 리서치 | "AS-01 가정을 검증할 인터뷰 질문지 만들어줘" |
| 리서치 | "인터뷰 메모 정리해줘" + 메모 파일 첨부 |
| 리서치 | "가입 흐름 사용성 테스트 계획 세워줘" |
| 디자인 | "이 기획으로 디자인 시스템 만들어줘" |
| 디자인 | "SCR-03 화면 와이어프레임 그려줘" |
| 디자인 | "Figma로 시안 만들어줘" (Figma 연결 필요) |

"experiments/우리서비스 폴더에 만들어줘"처럼 저장 위치를 지정하면 기존 결과와 섞이지 않습니다.

## 진행 흐름

```text
기획 ─ 서비스 기획서 → IA → 유저 플로우 → 정책서
│      → 화면 요구사항 정의서 → 인수 조건 → 트래킹 플랜 → 기획 검토
│
├─ 리서치 (선택) ─ 인터뷰로 가정 검증 · 사용성 테스트로 설계 검증
│
▼
디자인 ─ 디자인 브리프 → UX 라이팅 → 디자인 토큰 → 컴포넌트
       → UI 명세 · 와이어프레임 → 시안 → 접근성 검토 → 개발 인계 → 디자인 검토
```

## 문서에 보이는 표시

| 표시 | 뜻 | 할 일 |
| --- | --- | --- |
| 사실 | 자료나 근거가 있는 내용 | - |
| 가정 | 아직 검증되지 않은 임시 내용 | 필요하면 리서치로 검증 |
| 결정 필요 | 선택에 따라 결과가 달라지는 항목 | **답해 주세요** |
| 확정 | 팀이 결정한 내용 | - |

문서끼리는 번호로 연결됩니다: 문제 `P-01`, 목표 `G-01`, 가정 `AS-01`, 화면 `SCR-01`, 흐름 `F-01`, 정책 `POL-01`, 완료 기준 `AC-01`, 사용성 문제 `UT-01`, 반영 제안 `REC-01`.

## 꼭 알아 둘 약속

- Claude는 모르는 내용을 지어내지 않습니다. 빈칸이나 "결정 필요"가 많으면 정보를 더 알려 주세요.
- 인터뷰와 사용성 테스트는 사람이 진행합니다. Claude는 계획을 세우고 넘겨받은 기록을 분석합니다.
- 분석 결과는 "제안"으로 나옵니다. "REC-01 반영해줘"처럼 채택한 것만 문서에 반영됩니다.
- 인터뷰 메모에서 실명과 연락처는 지우고 넘겨 주세요.
- 스킬·에이전트 파일은 직접 고치지 말고 관리자에게 요청해 주세요.

## 폴더 구조

```text
sossbar-agent/
├─ README.md                        설치 방법 · 사용 가이드
├─ CLAUDE.md                        Claude Code 진입점 · 사용 안내 · 변경 이력
├─ AGENTS.md                        공통 원칙 · 역할 · 진행 순서 · 폴더 규칙
├─ skills/                          스킬 = 어떻게 작업하는지 (폴더마다 SKILL.md)
│  ├─ planning/                     기획
│  │  ├─ service-planning           기획 전체 진행 (총괄)
│  │  ├─ product-brief              서비스 기획서
│  │  ├─ brief-enrichment           기획서 보강 제안 (선택)
│  │  ├─ information-architecture   IA · 사이트맵
│  │  ├─ user-flow                  유저 플로우
│  │  ├─ policy-spec                정책서
│  │  ├─ screen-spec                화면 요구사항 정의서
│  │  ├─ acceptance-criteria        인수 조건
│  │  └─ tracking-plan              트래킹 플랜
│  ├─ research/                     UX 리서치
│  │  ├─ user-interview             사용자 인터뷰
│  │  └─ usability-test             사용성 테스트
│  └─ design/                       디자인
│     ├─ product-design             디자인 전체 진행 (총괄)
│     ├─ design-brief               디자인 브리프 · 원칙
│     ├─ ux-writing-system          UX 라이팅
│     ├─ design-foundations         디자인 토큰
│     ├─ component-spec             컴포넌트 명세
│     ├─ product-ui-design          UI 명세 · 와이어프레임
│     ├─ visual-ui-production       Figma 시안 · 프로토타입
│     ├─ accessibility-review       접근성 검토
│     ├─ design-handoff             개발 인계
│     └─ design-review              디자인 정합성 검토
├─ agents/                          에이전트 = 누가 판단하는지
│  ├─ planning/
│  │  ├─ product-manager.md         PM · PO 통합
│  │  └─ spec-reviewer.md           기획 검토
│  ├─ research/
│  │  └─ ux-researcher.md           UX 리서처
│  └─ design/
│     ├─ design-director.md         디자인 방향 조율
│     ├─ design-system-designer.md  디자인 시스템
│     ├─ product-ui-designer.md     화면 설계 · 와이어프레임
│     ├─ ux-writer.md               UX 문구
│     ├─ accessibility-reviewer.md  접근성 검토
│     └─ design-reviewer.md         디자인 검토
├─ references/                      모든 스킬이 참고하는 공통 문서
│  ├─ planning-principles.md        기획 원칙 · 식별자 · 그림 규칙
│  ├─ web-service-checklist.md      웹 서비스 공통 점검 목록
│  ├─ service-context.md            서비스 기본 정보
│  ├─ glossary.md                   용어 사전
│  ├─ product-design-handoff.md     기획 · 디자인 · 개발 인계 규칙
│  ├─ design-principles.md          디자인 원칙
│  ├─ design-context.md             디자인 기본 정보
│  └─ design-system-references.md   외부 디자인 시스템 참고 기준
├─ scripts/
│  └─ link-skills.sh                스킬 인식용 링크 생성
├─ .claude-plugin/                  플러그인 · 마켓플레이스 설정
├─ .claude/                         Claude Code 연결용 링크 (자동 생성)
├─ .agents/                         Codex용 스킬 사본
└─ .codex/                          Codex용 에이전트 설정
```

## 관리자용: 스킬·에이전트를 바꿀 때

- 스킬과 에이전트는 역할별 그룹 폴더(`planning/`, `research/`, `design/`)에 둡니다.
- 스킬을 추가·이동·삭제하면 `bash scripts/link-skills.sh`를 실행합니다.
- 에이전트를 추가·이동·삭제하면 `.claude-plugin/plugin.json`의 `agents` 목록도 고칩니다. 새 스킬 그룹 폴더는 `skills` 목록에 추가합니다.
- Codex 사본(`.agents/skills`, `.codex/agents`)도 함께 갱신합니다.
- 올리기 전에 `claude plugin validate .`로 설정을 검사합니다.
- 규칙과 변경 이력은 `AGENTS.md`, `CLAUDE.md`에 기록합니다. 플러그인 사용자에게는 이 두 파일이 읽히지 않으므로, 모든 스킬이 지켜야 하는 규칙은 스킬 본문이나 `references/`에 둡니다.
