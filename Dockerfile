FROM rocm/tensorflow:rocm3.5-tf2.2-dev

ARG USERNAME
ARG VIRTUAL_ENV=.venv

RUN apt-get update; apt-get install sudo python3.8 python3.8-dev graphviz

RUN python3.8 -m pip install 'tensorflow-rocm<=2.2' virtualenv matplotlib keract numpy \
	keras notebook pydot graphviz jupyterthemes virtualenv-make-relocatable &\
	python3.6 -m pip uninstall -y tensorflow

RUN jt -T -N -kl -t onedork  # dark theme for jupyter

USER $USERNAME

WORKDIR /mnt

CMD "python3.8 -m venv --upgrade --copies $VIRTUAL_ENV; virtualenv-make-relocatable $VIRTUAL_ENV; jupyter-notebook"
