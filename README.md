# My resume

My professional resume hosted on [https://januszwisniowski.it](https://januszwisniowski.it).

# Building

1. Download and install [Yarn](https://yarnpkg.com/lang/en/docs/install/).
1. Download and install [wkhtmltopdf](https://wkhtmltopdf.org), add it to the PATH.
1. Go to the project root directory.
1. Run `yarn`.
1. Run [`build.sh`](build.sh).

The output is generated in the [`dist`](dist) directory.

# Deploying

The `master` branch is hosted on Github Pages under [https://januszwisniowski.it](https://januszwisniowski.it).

To deploys the `dist` directory from the last commit on `develop` branch to the `master` branch:

    ./deploy.sh

To perform a build ([`build.sh`](build.sh)), push the changes and deploy them to `master`: 

    ./full_deploy.sh <VERSION_NUMBER>

The deployed commit is tagged with `<VERSION_NUMBER>`.

# Acknowledgements

Built with [Hackmyresume](https://github.com/hacksalot/HackMyResume) and [JSON Resume](https://jsonresume.org).
