FROM marcelocg/phoenix

RUN git clone https://github.com/bigardone/phoenix-trello.git && \
    cd phoenix-trello && \
    yes | mix deps.get && \
    npm install -g webpack

ADD docker.exs phoenix-trello/config/

ADD docker-run.sh phoenix-trello/bin/ && \
    chmod u+x phoenix-trello/bin/docker-run.sh

CMD ["phoenix-trello/bin/docker-run.sh"]
