release steps
=============

The documentation is used to release `sphinx-deployment`.

README.md
---------

- Find `https://raw.github.com/teracy-official/sphinx-deployment/develop/scripts/spxd.sh` and
replace `develop` with the right release version, for example: `v0.1.0`

CHANGELOG.md
------------

- Copy release notes from sphinx-deployment project on issues.teracy.org, for example:

https://issues.teracy.org/secure/ReleaseNote.jspa?version=10003&styleName=Text&projectId=10405&Create=Create&atl_token=BD5N-YNBS-EHHQ-478Z%7C87dd31199258f9de5ade180582481463461ded32%7Clin

- Note: Only copy the main issues that is worth mentioning and change the format to Markdown instead.

scripts/spxd.sh
---------------

- Find `develop` branch and replace it by the release version.

Note: After merging tag version into master/ branch, remember to update the right branch on
README.md and scripts/spxd.sh
