FROM python:3.6.8-slim
LABEL AUTHOR=sulabh.chaturvedi@outlook.com

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev --fix-missing --no-install-recommends

ENV INSTALL_PATH /mobydock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt 
RUN pip3 install -r requirements.txt 

COPY . . 

VOLUME ["static"]

CMD gunicorn -b 0.0.0.0:8000 "mobydock.app:create_app()"