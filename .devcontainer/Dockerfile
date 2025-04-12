FROM debian:bookworm

USER root

ARG TARGET_GO_VERSION=latest \
    GOLANGCILINT_VERSION=latest \
    TARGET_GOROOT=/usr/local/go \
    TARGET_GOPATH=/go \
    DEBIAN_FRONTEND=noninteractive \
    USERNAME=vscode \
    USER_UID=1000 \
    USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt update \
    && apt install -y sudo bash-completion wget make curl openssh-client locales bash git gnupg2 ca-certificates \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN chsh --shell /bin/bash ${USERNAME}

RUN echo 'export PS1="\[\033[0;32m\]\u\[\033[0m\] ➜ \[\033[1;34m\]\w\[\033[0m\] \$(if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then echo \"(\[\033[1;31m\]\$(git rev-parse --abbrev-ref HEAD)\[\033[0m\])\"; fi)\$ "' >> /home/$USERNAME/.bashrc

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8

WORKDIR /workspace

USER $USERNAME

SHELL ["/bin/bash", "-c"]
CMD ["/bin/bash"]
