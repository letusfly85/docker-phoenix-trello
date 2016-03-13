FROM tylerwaitt/phoenix

RUN git clone https://github.com/bigardone/phoenix-trello.git && \
    cd phoenix-trello && \
    yes | mix deps.get && \
    npm install -g webpack && \
    npm install webpack

RUN apt-get update && \
    apt-get install -y erlang-dev build-essential

RUN wget https://raw.github.com/wiki/rebar/rebar/rebar && \
    mkdir -p /root/.mix && \
    cp rebar /root/.mix/rebar && \
    chmod u+x /root/.mix/rebar

ADD docker.exs phoenix-trello/config/

ADD docker-run.sh phoenix-trello/bin/

RUN chmod u+x phoenix-trello/bin/docker-run.sh

CMD ["phoenix-trello/bin/docker-run.sh"]
