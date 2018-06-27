# Iron.io Node Boilerplate

This uses [Iron.io][iron-io]’s [Iron.io’s Node Docker image][node-docker] as a baseline for applications,
already configured for [Manifold][manifold].

## Install

### Dependencies

1.  Sign up for a [free Manifold account][manifold-register].
2.  Install the [Manifold CLI][manifold-cli], and log in with `manifold login`.
3.  Install the [Iron.io CLI][iron-cli] (Manifold will log in for us!).
4.  Install [Docker][docker], sign up for a [Docker ID][docker-hub], and log in with `docker login`.

### Services

On [Manifold][manifold], create a new **project** and provision
**IronWorker** & **LogDNA** plans straight from your Manifold Dashboard.

## Developing

```
git clone git@github.com:manifoldco/iron-example-app.git
cd iron-example-app
npm i
docker run --rm -v "$PWD":/worker -w /worker iron/node:dev npm install
```

To work with `manifold run`, edit the `.manifold.yml` file ([instructions here][manifold-config]).

## Deploying

### Manifold Token

IronWorker will need access to your Manifold project to run. For that, it’ll
need a token. This permits IronWorker to grab credentials securely from your
Manifold account. To create one, run:

```
manifold tokens create
```

🙈 Keep it secret, keep it safe!

### Publishing to Docker Hub & IronWorker

This app has a `deploy` script that can be invoked with a token:

```
TAG="MY_DOCKER_TAG" MANIFOLD_TOKEN="MY_MANIFOLD_TOKEN" npm run deploy
```

Where `TAG` is a Docker image tag (e.g.: `"manifoldco/iron-example:0.1.0"`),
and `MANIFOLD_TOKEN` is the token you created in the previous step.

This is the full deploy script:

```
docker build -t $TAG . && docker push $TAG && manifold run -- iron register -e \"MANIFOLD_API_TOKEN=$MANIFOLD_TOKEN\" $TAG
```

[docker]: https://docs.docker.com/install/
[docker-hub]: https://hub.docker.com
[iron-io]: https://github.com/iron-io
[iron-cli]: http://dev.iron.io/worker/cli/
[manifold]: https://dashboard.manifold.co
[manifold-cli]: https://docs.manifold.co/docs/install-77T6auwaaIQcgA4QGouO0
[manifold-register]: https://dashboard.manifold.co/register
[manifold-config]: https://docs.manifold.co/docs/config-38vPGWk1N6egqMwKEwcCAi
[node-docker]: https://hub.docker.com/r/iron/node/
