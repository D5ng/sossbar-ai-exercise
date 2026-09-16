# 제품 구축 하네스

웹 서비스의 문제 정의부터 제품 기획, 디자인 시스템, 실제 UI와 개발 인계까지 일관된 제품 산출물을 만든다. 이후 개발 하네스는 디자인 인계 계약을 입력으로 추가한다.

## 공통 원칙

- 모든 작업 전에 `references/planning-principles.md`를 읽는다.
- 디자인 관련 작업은 `references/design-principles.md`도 읽는다.
- 서비스별 정보가 필요하면 `references/service-context.md`, `references/design-context.md`, `references/glossary.md`를 읽고 확인되지 않은 내용을 사실로 만들지 않는다.
- 단계 간 입력과 책임은 `references/product-design-handoff.md`를 따른다.
- 기획 작업은 `references/web-service-checklist.md`로 회원 탈퇴, 관리자, 약관·동의, 오류 페이지, 지원 환경처럼 자주 빠지는 공통 항목의 판정 여부를 확인한다.

## 서비스 기획 하네스

- 서비스 기획 전체, MVP 기획, 기능 기획, 기존 기획 수정·보완 요청에는 `skills/planning/service-planning/SKILL.md`를 먼저 읽는다.
- 사용자가 출력 루트를 지정하면 산출물은 `{output-root}/planning/`에 두며, 기존 `planning/` 결과와 섞지 않는다.
- 단일 산출물 요청에는 해당 스킬만 사용한다.
- PM과 PO의 제품 책임은 `agents/product-manager.md`의 통합 역할로 다룬다.

### 산출물 순서

1. `product-brief` — 서비스 기획서
2. `information-architecture` — IA(정보 구조도·사이트맵, 접근 제어)
3. `user-flow` — 유저 플로우
4. `screen-spec` — 화면 요구사항 정의서(정보·동작·상태·화면 규칙. 와이어프레임은 디자이너가 `ux-design`에서 그린다)

정책서, 인수 조건, 트래킹 플랜, 별도 기획 검토는 만들지 않는다. 권한은 IA 접근 제어에, 입력·상태·저장·삭제·알림 규칙은 화면 정의서의 화면 규칙(`SCR-*-R*`)에 둔다.

스킬 이름, 파일명과 식별자는 연결 구조를 위해 그대로 쓰고, 일반 명칭은 문서 제목과 설명에 함께 적는다.

필요한 단계만 실행할 수 있다. 앞 단계가 없으면 작업을 중단하지 말고 가정을 명시한 초안을 만든 뒤, 결정이 필요한 항목을 별도로 남긴다.

## UX 리서치 하네스

- 사용자 인터뷰의 계획·분석에는 `skills/research/user-interview/SKILL.md`, 사용성 테스트의 계획·분석에는 `skills/research/usability-test/SKILL.md`를 사용한다.
- 리서치 역할은 `agents/ux-researcher.md`가 맡는다. 화면을 설계한 사람이 자기 화면의 사용성 테스트를 분석하지 않는다.
- 실제 인터뷰와 테스트는 사람이 진행한다. 사용자가 제공한 기록 없이 참가자 응답·행동·결과를 만들지 않는다.
- 산출물은 `research/` 아래 스터디별 폴더에 둔다. 사용자가 출력 루트를 지정하면 `{output-root}/research/`에 둔다.
- 결과는 원문을 직접 바꾸지 않고 반영 제안(`REC-*`)으로 돌려준다. 채택한 제안만 `service-planning` 또는 `product-design`의 부분 재실행으로 반영한다.

```text
기획서 가정 AS-* → 인터뷰 → 가정 판정 · 반영 제안 → 기획서
화면 · 프로토타입 → 사용성 테스트 → 사용성 문제 UT-* · 반영 제안 → 기획 또는 디자인
```

## 제품 디자인 하네스

- 디자인 시스템 구축, 서비스 키워드·디자인 원칙 정의, UX 라이팅, 실제 UI 설계, 디자인 개발 인계 요청에는 `skills/design/product-design/SKILL.md`를 먼저 읽는다.
- 사용자가 하나의 문서 초안만 명시적으로 요청하고 기존 공통 시스템에 영향을 주지 않을 때만 해당 전용 스킬을 직접 사용한다. 공유 토큰·컴포넌트 변경, 실제 제품 UI 설계처럼 다른 산출물의 영향 확인이 필요한 작업은 `product-design`의 부분 재실행으로 처리한다.
- 외부 디자인 시스템은 `references/design-system-references.md`의 경계에 따라 구조와 의사결정 방식을 참고하고, 우리 서비스의 결정으로 그대로 복제하지 않는다.
- 시스템 구축은 `agents/design-system-designer.md`, 실제 화면 구성은 `agents/ux-designer.md`가 책임진다.
- `agents/ux-writer.md`는 시스템과 화면에서 공유한다.
- 접근성 검토와 최종 정합성 검토는 각각 `agents/accessibility-reviewer.md`, `agents/design-reviewer.md`가 원문을 수정하지 않고 수행한다.

### 산출물 순서

1. `design-brief`
2. `ux-writing-system`의 시스템 모드
3. `design-foundations`
4. `component-spec`
5. `ux-design`
6. `ux-writing-system`의 화면 모드
7. 실제 시각 UI 요청 시 `visual-ui-production`
8. `accessibility-review`
9. `design-handoff`
10. `design-review`

디자인 시스템 구축과 UI 설계는 필요한 범위만 실행한다. UI 설계 중 시스템에 없는 요구는 임의 구현하지 않고 `GAP-*`로 반환하며 `design/system/gaps.md`에서 판정 상태를 관리한다.

## 폴더 구조

```text
skills/
├─ planning/ ─ 기획 스킬 5개
├─ research/ ─ 사용자 인터뷰, 사용성 테스트
└─ design/ ─ 디자인 스킬 10개
agents/ ─ 에이전트 8개, 하위 폴더 없이 한곳에 둔다
.claude/skills/ ─ 스킬별 링크, scripts/link-skills.sh로 생성
.claude-plugin/ ─ 플러그인·마켓플레이스 설정
.agents/skills/ ─ Codex용 평면 사본
```

| 역할 | 에이전트 |
| --- | --- |
| 기획 | `product-manager` |
| 리서치 | `ux-researcher` |
| 디자인 | `design-director`, `design-system-designer`, `ux-designer`, `ux-writer`, `accessibility-reviewer`, `design-reviewer` |

- 이 저장소는 폴더로 열어 쓰거나 Claude Code 플러그인(`sossbar`)으로 설치해 쓴다. 설치 방법은 `README.md`에 있다.
- 플러그인으로 설치하면 `CLAUDE.md`와 `AGENTS.md`는 읽히지 않는다. 모든 스킬이 반드시 지켜야 하는 규칙은 스킬 본문이나 `references/`에 둔다.
- Claude Code는 `.claude/skills/<스킬 이름>/SKILL.md` 평면 구조만 인식한다. 스킬을 추가·이동·삭제하면 `scripts/link-skills.sh`를 실행해 링크를 다시 만든다.
- 스킬은 역할별 그룹 폴더(`planning/`, `research/`, `design/` 또는 새 그룹)에 둔다. 새 그룹 폴더를 만들면 `.claude-plugin/plugin.json`의 `skills` 목록에 추가한다.
- 에이전트는 `agents/` 바로 아래에 둔다. 폴더로 열 때는 하위 폴더도 인식되지만, 플러그인은 `agents/` 바로 아래 파일만 인식하고 `plugin.json`에 에이전트 경로를 등록하는 방식도 동작하지 않았다(Claude Code 2.1.251에서 확인). 에이전트는 frontmatter의 `name`으로 구분하므로 이름이 겹치지 않게 한다.
- 에이전트와 스킬이 다른 스킬을 가리킬 때는 스킬 이름을 함께 쓴다. 플러그인으로 설치된 환경에서는 루트 기준 경로가 사용자 프로젝트에 없으므로 이름으로 스킬을 찾는다.
- Codex용 `.agents/skills`는 폴더 그룹 없이 스킬 이름별 사본으로 유지한다. `product-design` 사본만 에이전트 호출 문구 한 줄이 Codex용으로 다르다.
- `.claude/references`와 `.agents/references`는 `references/`로 가는 링크다. 모든 스킬이 그룹 폴더로 옮겨져 지금은 쓰이지 않지만, 평면 위치에서 `../../references/`를 쓰는 스킬이 생겨도 깨지지 않도록 남겨 둔다.
- 스킬 안의 상대 경로는 실제 위치 기준으로 쓴다. 그룹 폴더 안의 스킬에서는 `../../../references/`, 같은 그룹 스킬은 `../<스킬>/SKILL.md`다.
- 다른 그룹의 스킬을 가리킬 때는 상대 경로를 쓰지 않고 스킬 이름과 루트 기준 경로를 함께 쓴다. 예: `usability-test` 스킬(`skills/research/usability-test/SKILL.md`). 상대 경로는 링크나 사본 위치에서 읽을 때 달라지기 때문이다.

## 확장 원칙

- 새로운 서비스나 별도 브랜드는 기존 `planning/`, `design/` 결과를 덮어쓰지 않고 출력 범위를 구분한다.
- 상위 결정이 바뀌면 `references/product-design-handoff.md`의 변경 영향에 따라 하위 산출물을 확인한다.
- 향후 개발 하네스는 `design/handoff/`만 단독으로 사용하지 않고 관련 화면 요구사항 정의서(화면 규칙 포함), UI 명세, `visual-index.md`, 디자인 파일·노드 식별자를 함께 입력으로 사용한다.
- 에이전트는 누가 판단하는지, 스킬은 어떻게 작업하는지를 정의한다. 같은 책임의 에이전트나 스킬을 다른 이름으로 중복 생성하지 않는다.
