FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 18
RUN mkdir $NVM_DIR

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash ;

RUN bash -c 'source $NVM_DIR/nvm.sh && \
  nvm install 12 && \
  nvm install 14 && \
  nvm install 16 && \
  nvm install 19 && \
  nvm install $NODE_VERSION && \
  nvm use $NODE_VERSION && \
  nvm alias default $NODE_VERSION'

# shortcut scripts that allows running node commands without
# nvm intially being loaded, because bash is default running non-interactive
RUN printf "#!/bin/bash \
  \nsource \$NVM_DIR/nvm.sh \
  \nnvm \$@\n" > /usr/bin/nvm && chmod +x /usr/bin/nvm

RUN printf "#!/bin/bash \
  \nsource \$NVM_DIR/nvm.sh \
  \nnode \$@\n" > /usr/bin/node && chmod +x /usr/bin/node

RUN printf "#!/bin/bash \
  \nsource \$NVM_DIR/nvm.sh \
  \nnpm \$@\n" > /usr/bin/npm && chmod +x /usr/bin/npm

RUN printf "#!/bin/bash \
  \nsource \$NVM_DIR/nvm.sh \
  \nnpx \$@\n" > /usr/bin/npx && chmod +x /usr/bin/npx

RUN printf "#!/bin/bash \
  \nbash -lc \"\$@\"\n" > /usr/bin/run && chmod +x /usr/bin/run

WORKDIR /app
