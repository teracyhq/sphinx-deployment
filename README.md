sphinx-deployment
=================

Automatic setup and deployment for [sphinx][] docs.

This project is intended to be used to deploy [sphinx][] project on:

- [Github Pages](https://help.github.com/categories/20/articles)
- [Rsync](http://en.wikipedia.org/wiki/Rsync)
- PaaS services: [heroku](http://heroku.com/), etc.

Usage
-----

**0. `$ make init_gh_pages`**

For **the first time only** to create and push the `$(DEPLOY_BRANCH)` if it does not exist.

Note: I'm working to remove this `target` to use just `make setup_gh_pages` target to initialize
`$(DEPLOY_BRANCH)` if it does not exists.

**1. `make setup_gh_pages`**

For one time only when your [sphinx][] project is cloned to create `$(DEPLOY_DIR)` to track
`$(DEPLOY_BRANCH)`.

**2. `$ make generate`**

For generating contents, alias for `make html`

**3. `$ make deploy`**

Deploy the generated content to the target `$(DEPLOY_BRANCH)`

**4. `$ make gen_deploy`**

Generate and deploy the generated content to the target `$(DEPLOY_BRANCh)`


Installation
------------

**1. Bash script**

Just run this bash script from your root git repository project and it's enough.

You need to specify the <docs_path> to your sphinx docs directory:

``` bash
$ cd <your_project>
$ wget https://raw.github.com/teracy-official/sphinx-deployment/develop/scripts/spxd.sh && chmod +x ./spxd.sh && ./spxd.sh -p <docs_path>
```

For example:

``` bash
$ cd my_project
$ wget https://raw.github.com/teracy-official/sphinx-deployment/develop/scripts/spxd.sh && chmod +x ./spxd.sh && ./spxd.sh -p ./docs
```

**2. Manual**

You need to copy these following files to your [sphinx][] directory:

- `docs/requirements`
- `docs/sphinx_deployment.mk`

To build with `travis`, you need to copy these following files to your root project directory:

- `.travis.yml`
- `.travis/setup.sh`


Configuration
-------------

**1. `sphinx_deployment.mk`**

You need to configure these deployment configurations following your project organization on
`sphinx_deployment.mk` file on `hoatle-sphinx-deployment` branch.

``` Makefile
# Deployment configurations

# The development directory tracking DEPLOY_BRANCH
DEPLOY_DIR      = _deploy

# Copy contents from $(BUILDDIR) this this directory
DEPLOY_HTML_DIR = docs
DEPLOY_BRANCH   = gh-pages

#if REPO_URL was NOT defined by travis-ci
ifndef REPO_URL
#REPO_URL       = git@github.com:hoatle/sphinx-deployment.git
endif
```

**2. `Makefile`**

- Merge `hoatle-sphinx-deployment` branch into your working branch for all the changes from
installation and configuration steps above. For example:

``` bash
$ git checkout master
$ git merge -X theirs hoatle-sphinx-deployment
```

`-X theirs` means the `hoatle-sphinx-deployment` branch content will overwrite existing content of
`master` branch if any. You need to review the change carefully after this merge to make sure it
does overwrite anything by accident.

- Include `sphinx_deployment.mk` to your `Makefile`. (You don't have to do this with bash script
installation)

For example:

``` bash
echo '' >> docs/Makefile
echo 'include sphinx_deployment.mk' >> docs/Makefile
```

or:

``` bash
echo '' >> Makefile
echo 'include sphinx_deployment.mk' >> Makefile
```


Continuous Integration Build
----------------------------

**1. travis-ci**

Move `.travis.yml` file to your root repository project, and configure it following its
instruction there. There is a supported `.travis/setup.sh` to export variables for `Makefile`
depending on the being-built branch.


**2. jenkins**

//TODO


Authors and contributors
------------------------

- Hoat Le: http://github.com/hoatle

- Many thanks to http://octopress.org/docs/deploying/ for inspiration.

License
-------

BSD License

```
Copyright (c) Teracy, Inc and individual contributors.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice,
       this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.

    3. Neither the name of Teracy nor the names of its contributors may be used
       to endorse or promote products derived from this software without
       specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

```

[sphinx]: http://sphinx-doc.org
