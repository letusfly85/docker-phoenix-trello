FROM marcelocg/phoenix

RUN git clone https://github.com/bigardone/phoenix-trello.git && \
    cd phoenix-trello && \
    mix deps.get && \
    npm install -g webpack && \

ADD docker.exs phoenix-trello/config/

ADD docker-run.sh phoenix-trello/bin/

CMD ["phoenix-trello/bin/docker-run.sh"]
