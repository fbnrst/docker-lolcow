FROM ubuntu:24.04

RUN apt-get update && apt-get install -y cowsay

CMD ["/bin/bash", "-c", "/usr/games/cowsay You worry too much about your job. Stop it. You are not paid enough to worry."]
