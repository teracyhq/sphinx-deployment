release steps
=============

The documentation is used to release `sphinx-deployment`.

README.md
---------

- Find `https://raw.githubusercontent.com/teracyhq/sphinx-deployment/develop/scripts/spxd.sh` and
replace `develop` with the right release version, for example: `v0.1.0`

CHANGELOG.md
------------

- Mention issues from https://github.com/teracyhq/sphinx-deployment/issues for each release milestone


scripts/spxd.sh
---------------

- Find `develop` branch and replace it by the release version.

Note: After merging tag version into master/ branch, remember to update the right branch on
README.md and scripts/spxd.sh
