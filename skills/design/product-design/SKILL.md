---
name: product-design
description: 제품 기획을 기반으로 서비스 키워드, 디자인 원칙, 디자인 시스템, UX 라이팅, 실제 UI와 개발 인계까지 연결한다. "디자인 시스템 만들어줘", "우리 서비스 디자인해줘", "화면 설계해줘", 기존 디자인 결과 재실행·업데이트·수정·보완·부분 재작성·이전 결과 개선 요청에는 이 스킬을 먼저 사용한다. 공유 시스템에 영향이 없는 독립 문서 초안 하나만 명확히 요청한 경우에만 해당 전용 스킬을 사용한다.
---

# 제품 디자인 오케스트레이터

제품 의도를 재사용 가능한 디자인 시스템과 실제 서비스 UI로 연결한다. 시스템 구축과 화면 설계를 구분하고, 화면에서 발견한 공백을 다시 시스템 판단으로 되돌린다.

## 실행 모드

에이전트 팀을 기본으로 사용한다.

- 디자인 기반 구축: `design-director`, `design-system-designer`, `ux-writer`
- 제품 UI 설계: `product-ui-designer`, `design-system-designer`, `ux-writer`, 필요 시 `accessibility-reviewer`
- 최종 검토: 작성 팀과 분리된 `design-reviewer`

Claude Code에서 에이전트를 호출할 때는 각 `agents/**/*.md` 정의를 사용하고 `model: "opus"`를 명시한다. 다른 실행 환경에서는 같은 역할 정의와 현재 환경의 고품질 모델을 사용한다. 팀 실행을 지원하지 않으면 메인 에이전트가 동일한 스킬을 순차 실행하되 독립 검토를 완료했다고 표현하지 않는다.

## 공통 참조

1. `../../../references/planning-principles.md`
2. `../../../references/design-principles.md`
3. `../../../references/service-context.md`
4. `../../../references/design-context.md`
5. `../../../references/glossary.md`
6. `../../../references/product-design-handoff.md`

외부 디자인 시스템을 분석하거나 비교할 때만 `../../../references/design-system-references.md`를 읽는다.

## 외부 시각 도구와의 우선순위

`frontend-design` 같은 외부 디자인 스킬은 시각 방향과 타이포그래피 판단에만 참고한다. 무엇을 만들지는 이 하네스의 기획·디자인 문서가 정하며, 충돌하면 이 하네스가 우선한다. 문구는 `COPY-*`, 승인 게이트(`D-*`)와 미노출 규칙을 지키고, 시각적 완성도를 위해서라도 승인되지 않은 문구·수치·이미지를 채우지 않는다.

## 산출물

| 단계 | 담당 역할·스킬 | 기본 출력 |
| --- | --- | --- |
| 0 | 공통 컨텍스트 | `design/00-design-context.md` |
| 1 | `design-director` + `design-brief` | `design/01-design-brief.md`, `design/03-design-principles.md` |
| 2 | `ux-writer` + `ux-writing-system` | `design/02-brand-language.md`, `design/06-content-guidelines.md` |
| 3 | `design-system-designer` + `design-foundations` | `design/system/04-foundations.md` |
| 4 | `design-system-designer` + `component-spec` | `design/system/05-components/{component-id}.md`, `design/system/gaps.md` |
| 5 | `product-ui-designer` + `product-ui-design` | `design/ui/{feature}/{screen-id}.md` |
| 5-1 | `product-ui-designer` + `visual-ui-production` | 실제 디자인 산출물, `design/ui/{feature}/visual-index.md` |
| 6 | `accessibility-reviewer` + `accessibility-review` | `design/reviews/{scope}-accessibility.md` |
| 7 | `product-ui-designer` + `design-handoff` | `design/handoff/{feature}.md` |
| 8 | `design-reviewer` + `design-review` | `design/reviews/{scope}-design-review.md` |

사용자가 출력 루트를 지정하면 표의 `design/` 앞에 그 경로를 붙인다. 예를 들어 출력 루트가 `experiments/landing`이면 산출물은 `experiments/landing/design/`에 둔다. 출력 루트가 없을 때만 프로젝트 루트의 `design/`을 기본값으로 사용한다. 실험 또는 새 서비스의 산출물은 기존 결과를 덮어쓰지 않는다.

필요한 단계만 실행한다. 디자인 시스템 구축 요청에 제품 UI를 임의로 추가하거나, 화면 설계 요청에 전체 시스템을 다시 만들지 않는다. 사용자가 단일 문서 초안만 명시적으로 요청하고 공유 시스템에 영향이 없을 때만 전용 스킬을 직접 사용한다. 공유 토큰·컴포넌트 변경과 실제 제품 UI 설계는 영향 확인이 필요하므로 이 오케스트레이터의 부분 재실행으로 처리한다.

## Phase 0: 컨텍스트와 실행 유형

1. 사용자 자료, 관련 `planning/`, 기존 `design/` 산출물을 확인한다.
2. 다음 중 실행 유형을 정한다.
   - 디자인 기반 없음: 초기 구축
   - 기존 기반으로 새 기능·화면 설계: UI 실행
   - 특정 산출물 수정: 부분 재실행
   - 다른 서비스·브랜드: 기존 결과를 덮어쓰지 않고 출력 범위를 사용자와 구분
3. 기존 확정 결정과 사용 중인 토큰·컴포넌트는 사용자 요청 없이 변경하지 않는다.
4. 중간 결과와 검토 근거가 필요하면 `design/_workspace/`에 저장하고 삭제하지 않는다.

## Phase 1: 디자인 범위 설정

- 해결할 사용자 문제와 우선 흐름
- 디자인 시스템 구축인지 실제 UI 설계인지
- 대상 플랫폼, 테마, 브랜드·기술·접근성 제약
- 필요한 산출물과 제외 범위
- 제공된 참고 자료와 기존 자산

핵심 방향이 갈리지 않으면 가정을 표시하고 진행한다. 색상, 서체, 브랜드 성격처럼 선택에 따라 전체 시스템이 달라지는 항목은 후보와 영향을 먼저 제시한다.

## Phase 2: 디자인 기반 구축

다음 순서로 실행한다.

1. `../design-brief/SKILL.md`
2. `../ux-writing-system/SKILL.md`의 시스템 모드
3. `../design-foundations/SKILL.md`
4. 필요한 컴포넌트에 `../component-spec/SKILL.md`

디자인 브리프·콘텐츠·시스템 담당은 제품 근거와 키워드 해석을 공유한다. 상충하는 판단은 근거와 영향을 기록하고 `design-director`가 조정하며, 제품 정책은 `product-manager`에게 반환한다.

## Phase 3: 제품 UI 설계

1. 관련 사용자 흐름, 정보 구조(IA), 정책, 화면 요구사항과 AC를 선택한다.
2. 기존 디자인 시스템과 콘텐츠 가이드를 읽는다.
3. `../product-ui-design/SKILL.md`로 UI 문서 명세를 만든다.
4. `../ux-writing-system/SKILL.md`의 화면 모드로 실제 문구를 확정하고 UI 명세에 연결한다.
5. Figma 화면, 시각 시안, 프로토타입이나 실제 UI 제작 요청이면 최종 문구가 연결된 명세를 입력으로 `../visual-ui-production/SKILL.md`를 실행한다.
6. 시스템에 없는 요구를 `GAP-*`로 기록하고 화면에서 임의 해결하지 않는다.
7. 시스템 담당은 공백을 기존 활용, 확장, 신규 공통 컴포넌트, 화면 전용 패턴으로 판정하고 `design/system/gaps.md`에 기록한다.
8. 반영하기로 한 공백은 시스템 반영 후 UI 명세와 시각 산출물에 다시 적용한다. `발견 → 분류 완료 → 시스템 반영 → UI 재적용` 상태를 생략하지 않는다.

## Phase 4: 검토와 개발 인계

1. 이번 실행에서 생성하거나 변경한 시스템·UI 범위가 있으면 `../accessibility-review/SKILL.md`로 접근성 요구를 검토한다.
2. 근거가 명확한 누락은 작성자가 1회 보완하고, 변경 범위의 접근성을 다시 확인한다.
3. 실제 제품 UI를 생성하거나 변경했으면 `product-ui-designer`가 `../design-handoff/SKILL.md`로 개발 인계 초안을 만든다. 디자인 시스템만 구축한 경우에는 생략한다.
4. 둘 이상의 연관 문서를 만들었으면 `../design-review/SKILL.md` 기준으로 독립 검토한다.
5. 객관적인 누락·오기·연결 문제는 작성자가 최대 1회 수정하고 관련 검토를 다시 실행한다.
6. 공백과 리뷰 상태를 반영해 개발 인계의 준비 상태를 `Ready for Dev` 또는 `Blocked`로 확정한다. 미해결 Blocker/Major 공백은 `Blocked`다.
7. 제품·브랜드 범위가 갈리는 Blocker/Major는 자동 수정하지 않는다.

### 사용성 테스트 (선택)

실제 UI, 시각 시안 또는 프로토타입이 있고 사용자가 설계 검증을 원하면 `usability-test` 스킬(`skills/research/usability-test/SKILL.md`)로 테스트를 계획한다.

- 테스트는 사람이 진행한다. 기록이 없으면 계획까지만 만들고, 문서 점검 결과를 사용성 테스트 결과로 표시하지 않는다.
- 분석은 화면을 설계한 `product-ui-designer`가 아니라 `ux-researcher`가 맡는다.
- 사용성 문제의 반영 제안(`REC-*`)은 사용자가 채택한 것만 아래 부분 재실행으로 반영한다. 정책·흐름·화면 요구사항이 원인이면 `product-manager`에게 돌려보낸다.

## 부분 재실행

| 변경 | 반드시 영향 확인할 항목 |
| --- | --- |
| 제품 목표·정책·흐름 | 브리프, 원칙, UI, 문구, 인계 |
| 키워드·디자인 원칙 | Foundation, 컴포넌트, 콘텐츠, UI |
| Foundation | 관련 컴포넌트, UI, 접근성, 인계 |
| 컴포넌트 | 사용 화면, 문구, 접근성, 인계 |
| UI | 문구, 접근성, AC, 인계 |
| UX 라이팅 | 컴포넌트 콘텐츠 규칙, 관련 UI |
| 사용성 테스트 반영 제안 | 제안이 가리키는 UI·문구·컴포넌트, 접근성, 인계 |

영향 확인과 실제 수정은 구분한다. 기존 내용이 여전히 유효하면 변경하지 않는다.

## 에러 처리

- 특정 역할이 실패하면 1회 재시도하고, 다시 실패하면 누락과 영향을 명시해 가능한 다음 단계만 진행한다.
- 팀원 과반의 결과가 없으면 진행 상태와 필요한 입력을 사용자에게 보고한다.
- 문서나 역할 간 충돌은 삭제하거나 임의 통합하지 않고 양쪽 근거를 보존한다.
- 실제 렌더링·프로토타입을 검증하지 못했다면 문서 검토와 시각 검증을 구분한다.

## 완료 보고

```markdown
## 제품 디자인 결과

- 완료: {산출물과 경로}
- 부분 완료: {가정 또는 미검증 항목}
- 미작성: {산출물과 이유}
- 시스템 공백: {GAP 목록과 판정}
- 결정 필요: {가장 중요한 제품·브랜드 질문}
- 검토 결과: {진행 가능 여부, Blocker/Major 수, 시각 검증 여부}
```

## 테스트 시나리오

### 디자인 시스템 초기 구축

제품 브리프와 핵심 흐름을 입력받으면 디자인 브리프와 콘텐츠 원칙을 만든 뒤 Foundation과 우선 컴포넌트를 연결한다. 근거 없는 브랜드 값은 가정 또는 결정 필요로 남긴다.

### 기존 시스템으로 UI 설계

기존 시스템과 신규 화면 요구사항을 입력받으면 재사용 가능한 컴포넌트로 UI를 구성하고, 해결되지 않는 요구만 `GAP-*`로 반환한 뒤 접근성과 개발 인계를 검토한다.

### 정보 부족

서비스 키워드만 주어지면 토큰 값을 확정하지 않는다. 키워드의 제품 근거와 행동 원칙 후보를 작성하고 결정 필요 항목을 남긴다.
