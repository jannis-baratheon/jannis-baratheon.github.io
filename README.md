# My resume

My professional resume - [click here](https://januszwisniowski.it/)

# Building

1. [Download and install Yarn](https://yarnpkg.com/lang/en/docs/install/)
1. Download and install [wkhtmltopdf](https://wkhtmltopdf.org), add it to the PATH
1. Go to the project root directory
1. Run `yarn`
1. Run `build.sh`

The output is generated in the [`dist`](https://github.com/jannis-baratheon/jannis-baratheon.github.io/tree/develop/dist) directory.

# Deploying

The `master` branch is hosted on Github Pages as (https://januszwisniowski.it/).

    ./deploy.sh

Deploys the `dist` directory from the last commit on `develop` branch to the `master` branch.

    ./full_deploy.sh <VERSION_NUMBER>

Performs a build (`build.sh`), commits and pushes the changes and deploys them to `master`. The deployed commit is tagged with `<VERSION_NUMBER>`.

# Acknowledgements

Built with [Hackmyresume](https://github.com/hacksalot/HackMyResume) and [JSON Resume](https://jsonresume.org).
