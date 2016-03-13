FROM marcelocg/phoenix

RUN git clone https://github.com/bigardone/phoenix-trello.git && \
    cd phoenix-trello && \
    yes | mix deps.get && \
    npm install -g webpack

RUN apt-get update && \
    apt-get install -y erlang-dev build-essential

ADD docker.exs phoenix-trello/config/

ADD docker-run.sh phoenix-trello/bin/

RUN chmod u+x phoenix-trello/bin/docker-run.sh

CMD ["phoenix-trello/bin/docker-run.sh"]
