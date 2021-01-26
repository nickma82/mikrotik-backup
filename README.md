[![GitHub](https://img.shields.io/github/license/nickma82/mikrotik-backup)]((https://opensource.org/licenses/MIT))
[![made-with-bash](https://img.shields.io/badge/made%20with-Bash-green.svg)](https://www.gnu.org/software/bash/)
![GitHub issues](https://img.shields.io/github/issues-raw/nickma82/mikrotik-backup)

# Backup Mikrotiks configurations

Script makes and downloads configuration backup to a server in text and binary formats.

##Features
* Multiple routers list allowed by space separated
* Login via ssh-key only (no password required)
* Pulls backups to local _backupdir_
* Setup via _mikrotik_backup.settings_ file

## Usage

* Setup your environment in `mikrotik_backup.settings`
* call `./mikrotik_backup.sh`

### PreRequisits

Upload public ssh key and attach it to the user.<br/>
https://wiki.mikrotik.com/wiki/Using_SSH_for_system_backup#Preparing_the_Mikrotik

### Restore Note

See: https://wiki.mikrotik.com/wiki/Manual:System/Backup#Loading_a_backup

## License

MIT Licensed. See LICENSE for full details.
Original Source from https://github.com/dntsk/mikrotik-backup by https://dntsk.dev/
