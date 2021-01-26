#!/usr/bin/env bash
# shellcheck disable=SC2154
# shellcheck disable=SC2181

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "${DIR}/mikrotik_backup.settings"
source "${DIR}/bash_micro_log"
source "${DIR}/bash_mikrotik_helpers"

for r in "${routers[@]}"; do
  mikrotik_get_os_version "$r" VERSION
  [ $? -ne 0 ] && err "Failed to connect to router:${r}" && continue
  info "Backing up MikroTik:${r} (found RouterOS version:${VERSION})"
  mikrotik_dump_backup "$r" "${r}"

  sleep 1
  mkdir -p "${fulldir}"
  sftp -i "${privatekey}" "${user}@${r}:${r}.*" "${fulldir}"
  [ $? -ne 0 ] && err "Failed to download backup files"

  info "Deleting remote backup files"
  mikrotik_exec "$r" "/file remove [/file find where name~\"${r}.*\"]"
  info "Rouer ${r} done."
done
