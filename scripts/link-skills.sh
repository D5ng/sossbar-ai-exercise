#!/usr/bin/env bash
# skills/ 아래 SKILL.md가 있는 폴더를 .claude/skills/<스킬 이름>으로 연결한다.
# Claude Code는 .claude/skills/<이름>/SKILL.md 평면 구조만 인식하므로,
# skills/planning/처럼 그룹 폴더를 쓰려면 스킬마다 링크가 필요하다.
# 스킬을 추가·이동·삭제한 뒤 다시 실행한다.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
dest="$root/.claude/skills"

# 이전 구조(.claude/skills 전체가 ../skills 링크)였다면 링크만 제거한다.
if [ -L "$dest" ]; then
  rm "$dest"
fi
mkdir -p "$dest"
find "$dest" -maxdepth 1 -type l -delete

find "$root/skills" -name SKILL.md | sort | while read -r file; do
  dir="$(dirname "$file")"
  name="$(basename "$dir")"
  if [ -e "$dest/$name" ]; then
    echo "스킬 이름 중복: $name" >&2
    exit 1
  fi
  ln -s "../../${dir#"$root"/}" "$dest/$name"
done

echo "연결한 스킬: $(find "$dest" -maxdepth 1 -type l | wc -l | tr -d ' ')개"
