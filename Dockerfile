FROM jenkins/jenkins:lts

USER root

# Instala dependencias necesarias para Ruby, rbenv y la gema pg
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    git \
    curl \
    libffi-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y docker.io

USER jenkins

ENV RBENV_ROOT=/var/jenkins_home/.rbenv
ENV PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"

# Instala rbenv y ruby-build
RUN git clone https://github.com/rbenv/rbenv.git $RBENV_ROOT && \
    cd $RBENV_ROOT && src/configure && make -C src && \
    mkdir -p $RBENV_ROOT/plugins && \
    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build

# (Opcional) Configura rbenv en el bashrc (solo útil si entras con bash)
RUN echo 'export RBENV_ROOT="$HOME/.rbenv"' >> /var/jenkins_home/.bashrc && \
    echo 'export PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"' >> /var/jenkins_home/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> /var/jenkins_home/.bashrc

# Instala Ruby
RUN $RBENV_ROOT/bin/rbenv install 3.2.2 && \
    $RBENV_ROOT/bin/rbenv global 3.2.2 && \
    $RBENV_ROOT/bin/rbenv rehash

# Verifica la instalación
RUN ruby -v

