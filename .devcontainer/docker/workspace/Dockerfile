FROM denoland/deno:${DENO_VERSION}

ARG USERNAME
ARG USER_GROUP_NAME
ARG USER_UID
ARG USER_GID
ARG TMP_PKG

# general packages
ARG PKG="sudo git vim curl zip unzip locales ${TMP_PKG}"

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y ${PKG} \
    && groupadd --gid ${USER_GID} ${USER_GROUP_NAME} \
    && useradd --uid ${USER_UID} --shell /bin/bash --gid ${USER_GID} -m ${USERNAME} \
    && echo %${USER_GROUP_NAME} ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/${USER_GROUP_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_GROUP_NAME}

# enable git
RUN su ${USERNAME} --command \
    'sudo git config --system --add safe.directory "/home/${USERNAME}/workspace"'

# setup locale
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
    && locale-gen en_US.UTF-8

# setup timezone
ARG TIME_ZONE
RUN ln -snf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && echo ${TIME_ZONE} > /etc/timezone
