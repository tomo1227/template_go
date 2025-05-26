FROM golang:1.24.3-bookworm

USER root

ENV DEBIAN_FRONTEND=noninteractive

# 環境変数の設定
ENV VERSION="latest" \
    TARGET_GOROOT="/usr/local/go" \
    TARGET_GOPATH="/go"
ARG  USERNAME="vscode"
ARG  USER_UID=1000
ARG USER_GID=$USER_UID

ENV GOROOT=${TARGET_GOROOT}
ENV GOPATH=${TARGET_GOPATH}
ENV PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

RUN apt update \
    && apt install -y sudo findutils binutils pkg-config bash-completion gcc tar wget make curl openssh-client locales bash git gnupg2 ca-certificates

RUN umask 0002
RUN if ! cat /etc/group | grep -e "^golang:" > /dev/null 2>&1; then \
        groupadd -r golang; \
    fi

RUN mkdir -p "${TARGET_GOROOT}" "${TARGET_GOPATH}"

RUN groupadd --gid $USER_GID $USERNAME 
RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME 
RUN chmod 0440 /etc/sudoers.d/$USERNAME
# RUN groupadd -r golang
RUN usermod -a -G golang "${USERNAME}"

RUN mkdir -p ${TARGET_GOROOT} ${TARGET_GOPATH} && \
    chown -R ${USERNAME}:golang ${TARGET_GOROOT} ${TARGET_GOPATH} && \
    chmod -R g+r+w ${TARGET_GOROOT} ${TARGET_GOPATH} && \
    find ${TARGET_GOROOT} -type d -print0 | xargs -n 1 -0 chmod g+s && \
    find ${TARGET_GOPATH} -type d -print0 | xargs -n 1 -0 chmod g+s
















# ENV TARGET_GO_VERSION=latest \
#     GOLANGCILINT_VERSION=latest \
#     TARGET_GOROOT=/usr/local/go \
#     TARGET_GOPATH=/go \
#     USERNAME=vscode

# ENV DEBIAN_FRONTEND=noninteractive

# ARG USERNAME=vscode
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#     && apt update \
#     && apt install -y sudo bash-completion wget make curl openssh-client locales bash git gnupg2 ca-certificates \
#     && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME

RUN chsh --shell /bin/bash ${USERNAME}

RUN echo 'export PS1="\[\033[0;32m\]\u\[\033[0m\] ➜ \[\033[1;34m\]\w\[\033[0m\] \$(if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then echo \"(\[\033[1;31m\]\$(git rev-parse --abbrev-ref HEAD)\[\033[0m\])\"; fi)\$ "' >> /home/$USERNAME/.bashrc

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8

ENV LC_ALL=ja_JP.UTF-8

WORKDIR /workspace

USER $USERNAME

SHELL ["/bin/bash", "-c"]
CMD ["/bin/bash"]
