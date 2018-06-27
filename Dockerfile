FROM iron/node

WORKDIR /usr/lib/manifold
RUN apk update
RUN apk add curl
RUN curl -SL https://github.com/manifoldco/manifold-cli/releases/download/v0.14.0/manifold-cli_0.14.0_linux_amd64.tar.gz | tar -xz
RUN ln -s /usr/lib/manifold/manifold /usr/bin/manifold

WORKDIR /app
ADD . /app
RUN npm install
ENTRYPOINT manifold run -- node server/index.js
