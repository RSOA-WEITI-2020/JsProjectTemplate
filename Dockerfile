FROM node:10

ENV WORKSPACE="/rosa/app/source/"

ADD *.js ${WORKSPACE}

WORKDIR ${WORKSPACE}

CMD ["npm", "start"]