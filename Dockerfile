FROM node:10

ENV WORKSPACE="/rosa/app/source/"

ADD *.js ${WORKSPACE}

WORKDIR ${WORKSPACE}

RUN cd ${WORKSPACE} && npm install

CMD ["npm", "start"]