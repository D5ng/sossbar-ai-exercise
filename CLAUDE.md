# 제품 구축 하네스

**목표:** 제품 기획에서 디자인 시스템, 실제 UI와 개발 인계까지 추적 가능한 산출물을 만든다.

**트리거:** 서비스 전체·MVP·기능 기획과 기존 기획 수정·보완에는 `skills/planning/service-planning/SKILL.md`를 사용한다. 브리프나 초기 아이디어가 빈약해 무엇을 더 넣을지 제안만 원하면 `skills/planning/brief-enrichment/SKILL.md`를 사용한다. 사용자 인터뷰와 사용성 테스트의 계획·기록 분석에는 `skills/research/user-interview/SKILL.md`, `skills/research/usability-test/SKILL.md`를 사용한다. 디자인 시스템, 서비스 키워드, UX 라이팅, 제품 UI와 디자인 개발 인계에는 `skills/design/product-design/SKILL.md`를 사용한다. 사용자가 공유 시스템에 영향이 없는 독립 문서 초안 하나만 명시적으로 요청했을 때만 `skills/` 아래 해당 전용 스킬을 직접 사용한다.

공통 원칙과 역할·산출물 상세는 `AGENTS.md`를 기준으로 한다.

## 스킬 우선순위

`frontend-design`(Anthropic 공식 플러그인)은 시각적 방향과 타이포그래피 판단에만 쓴다. **무엇을 만들지는 이 하네스가 정하고, 어떻게 보이게 할지에만 참고한다.**

| 상황 | 사용할 것 |
| --- | --- |
| 제품 UI, 화면 설계, 디자인 시스템, 문구 | `skills/design/product-design/SKILL.md`. 문구는 `COPY-*`, 승인 게이트(`D-*`)와 미노출 규칙을 반드시 지킨다. |
| 위 산출물의 시각 표현을 정할 때 | `frontend-design`을 보조로 참고한다. |
| 이 하네스와 무관한 순수 웹 구현·시안 | `frontend-design`을 직접 쓴다. |

충돌하면 이 하네스가 이긴다. `frontend-design`은 근거 없는 문구·수치·이미지를 만들어도 된다는 허가가 아니다. 승인되지 않은 정보는 시각적 완성도를 위해서라도 채우지 않는다.

## 변경 이력

| 날짜 | 변경 내용 | 대상 | 사유 |
| --- | --- | --- | --- |
| 2026-09-08 | 서비스 기획 하네스 초기 구성 | 전체 | 문제 정의부터 측정·검토까지 연결하기 위해 |
| 2026-09-08 | 통합 PM/PO 역할과 제품 디자인 하네스 추가 | `agents/`, `skills/`, `references/` | 디자인 시스템과 실제 UI를 분리하고 향후 개발 인계까지 연결하기 위해 |
| 2026-09-09 | `frontend-design` 플러그인 활성화와 스킬 우선순위 명시 | `CLAUDE.md`, `~/.claude/settings.json` | 시각 판단을 보강하되 승인 게이트와 문구 규칙이 밀리지 않게 하기 위해 |
| 2026-09-11 | IA 스킬과 웹 서비스 공통 점검 목록 추가, 기획 산출물에 일반 명칭 병기 | `skills/information-architecture/`, `references/web-service-checklist.md`, 기획 스킬, `agents/`, `AGENTS.md` | 서비스 전체 페이지 구조를 정리하는 문서가 없었고, 회원 탈퇴·관리자·약관 같은 공통 항목이 기획에서 빠지는 것을 막기 위해 |
| 2026-09-11 | IA를 유저 플로우 앞으로 이동하고 IA가 화면 ID를 먼저 부여하도록 변경 | `skills/service-planning/`, `skills/information-architecture/`, `skills/user-flow/`, `AGENTS.md` | 페이지 구조를 먼저 정하고 흐름이 그 화면 ID를 쓰는 일반적인 기획 순서를 따르기 위해 |
| 2026-09-11 | 브리프 보강 제안 스킬 추가 | `skills/brief-enrichment/`, `skills/service-planning/`, `skills/product-brief/`, `AGENTS.md`, `CLAUDE.md` | 기획 초반 브리프가 틀린 곳은 없지만 얇을 때, 원문을 바꾸지 않고 채택 여부를 고를 수 있는 보강 제안을 받기 위해 |
| 2026-09-11 | 기획 문서에 아스키아트 그림 규칙과 흐름도·사이트맵 트리·상태 전이도·추적 경로 그림 추가 | `references/planning-principles.md`, `skills/service-planning/`, `skills/information-architecture/`, `skills/user-flow/`, `skills/policy-spec/`, `agents/spec-reviewer.md` | 계층·분기·되돌아가는 경로가 표와 글만으로는 한눈에 읽히지 않아서 |
| 2026-09-11 | 기획 스킬·에이전트를 `planning/` 폴더로 그룹핑하고 `.claude/skills`를 스킬별 링크로 변경 | `skills/planning/`, `agents/planning/`, `.claude/skills/`, `scripts/link-skills.sh`, `AGENTS.md`, `CLAUDE.md` | 기획과 디자인 스킬·에이전트가 한 폴더에 섞여 있어 찾기 어려워서 |
| 2026-09-11 | UX 리서치 스킬(사용자 인터뷰, 사용성 테스트)과 `ux-researcher` 에이전트 추가, 가정에 `AS-*` 식별자 부여 | `skills/research/`, `agents/research/`, `.codex/agents/ux-researcher.toml`, `references/`, `skills/planning/product-brief/`, `skills/planning/service-planning/`, `skills/product-design/`, `AGENTS.md`, `CLAUDE.md` | 기획서의 가정을 실제 사용자 근거로 검증하고 설계가 통하는지 확인하는 단계가 하네스에 없어서 |
| 2026-09-11 | `.agents/references` 링크 추가 | `.agents/references`, `AGENTS.md` | Codex용 디자인 스킬 사본의 `../../references/` 경로가 없는 폴더를 가리키고 있어서 |
| 2026-09-11 | `screen-spec`의 일반 명칭을 화면 요구사항 정의서로 바꾸고 와이어프레임 담당을 디자이너(`product-ui-design`)로 명시 | `skills/planning/screen-spec/`, `skills/product-ui-design/`, `agents/product-ui-designer.md`, 관련 문서 | 팀에서 와이어프레임을 디자이너가 그리므로 기획 문서가 디자이너 문서처럼 읽히지 않게 하기 위해 |
| 2026-09-11 | 디자인 스킬·에이전트를 `design/` 폴더로 그룹핑 | `skills/design/`, `agents/design/`, `.codex/agents/`, `.agents/skills/`, `AGENTS.md`, `CLAUDE.md` | 기획·리서치와 같은 방식으로 역할별 폴더에서 찾을 수 있게 하기 위해 |
| 2026-09-11 | Claude Code 플러그인·마켓플레이스 설정과 README 추가, `frontend-design` 우선순위를 디자인 스킬로 이동, 에이전트의 스킬 참조에 이름 병기 | `.claude-plugin/`, `README.md`, `.gitignore`, `skills/design/product-design/`, `skills/design/visual-ui-production/`, `agents/`, `.codex/agents/`, `AGENTS.md` | 팀원이 어느 프로젝트에서나 설치해 쓰게 하고, 플러그인은 `CLAUDE.md`를 읽지 않아서 |
| 2026-09-11 | 에이전트를 `agents/` 바로 아래로 되돌리고 `plugin.json`의 에이전트 목록 제거 | `agents/`, `.claude-plugin/plugin.json`, `AGENTS.md`, `README.md`, `skills/planning/service-planning/` | 플러그인이 하위 폴더 에이전트와 경로 등록 방식을 인식하지 못해 설치하면 에이전트가 0개로 나와서 |
