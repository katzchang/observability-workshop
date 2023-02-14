# Contributing Guidelines

Thank you for your interest in contributing to our repository! Whether it's a bug report, new feature, or question, we greatly value feedback and contributions from our community. Read through this document before submitting any issues or pull requests to ensure we have all the necessary information to effectively respond to your bug report or contribution.

In addition to this document, review our [Code of Conduct](CODE_OF_CONDUCT.md). For any code of conduct questions or comments, send an email to oss@splunk.com.

## Contributor License Agreement

Before contributing, you must sign the [Splunk Contributor License Agreement (CLA)](https://www.splunk.com/en_us/form/contributions.html).

## Contributing to the Observability Workshop

When working on the workshop, we advise that you review your changes locally before committing them. Use the `hugo server` command to live preview your changes (as you type) on your local machine.

## Install Go & Hugo

``` bash
cd ~
```

``` bash
brew install go
```

``` bash
brew install hugo
```

## Install yq

You will also need to install `yq` if it is not already installed on your system.

``` bash
brew install yq
```

## Install Node

You will also need to install `node` if it is not already installed on your system, then add the PostCSS CLI package

``` bash
brew install node
```

``` bash
npm install postcss-cli
```

## Cloning the reposistory

``` bash
git clone https://github.com/splunk/observability-workshop.git
```

``` bash
cd observability-workshop
```

``` bash
hugo server
```

## Running the docs server

In most cases, the default settings with `hugo server` work well, and Hugo is available at `http://localhost:1313`. If you need to change the port, you can do so by passing the `--port` flag e.g. `hugo server --port=1314`. The documentation built from your current branch is then accessible through your favorite browser at e.g. `http://localhost:1314`.

## Optimising images

Install `optipng`:

``` bash
brew install optipng
```

and then run the following command in the `content` directory:

``` bash
find . -type f -iname "*.png" -exec optipng -nb -nc {} \;
```

## Test release build locally

Build a release with

``` bash
./.github/ci/build_site
```

The output will be in `./site/vdev`.

To run a webserver that mimics GitHub Pages, install [devd][devd], e.g. with `brew install devd`.

Then run

``` bash
devd /observability-workshop/vdev/=./site/vdev /=./site/vdev
```

and visit [http://localhost:8000/](http://localhost:8000/) to inspect the site.

[devd]: https://github.com/cortesi/devd

## How to create a new tagged release

1. On GitHub, navigate to the main page of the repository.

2. Under your repository name, click Actions.

3. In the left sidebar, click Deploy Workshop.

4. Above the list of workflow runs, select Run workflow dropdown and click Run workflow

Then the release will run through the CI/CD pipeline and be available shortly after.
