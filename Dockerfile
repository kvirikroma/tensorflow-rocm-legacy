FROM rocm/tensorflow:rocm3.5-tf2.2-dev

ARG USERNAME
ARG VIRTUAL_ENV=.venv
ENV USERNAME=$USERNAME
ENV VIRTUAL_ENV=$VIRTUAL_ENV

RUN apt-get update; apt-get install -y sudo python3.8 python3.8-dev python3.8-venv graphviz

RUN python3.6 -m pip uninstall -y tensorflow

RUN rm -rf /root/*

RUN useradd -ms /bin/bash $USERNAME

RUN bash -c "echo '${USERNAME} ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"

USER $USERNAME

ENV HOME=/home/$USERNAME
ENV PATH="${HOME}/.local/bin:${PATH}"

WORKDIR /home/$USERNAME

RUN python3.8 -m pip install --user --upgrade pip six

RUN python3.8 -m pip install --user packaging

RUN python3.8 -m pip install --user \
	'tensorflow-rocm<=2.2' virtualenv matplotlib keract numpy \
	keras notebook pydot graphviz jupyterthemes virtualenv-make-relocatable

RUN jt -T -N -kl -t onedork  # dark theme for jupyter

WORKDIR /mnt

CMD python3.8 -m venv --upgrade --copies $VIRTUAL_ENV && virtualenv-make-relocatable $VIRTUAL_ENV && jupyter-notebook
