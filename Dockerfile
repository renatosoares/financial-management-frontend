FROM node:lts-stretch 

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json yarn.lock /app/
RUN yarn 
RUN yarn global add @vue/cli

# start app
CMD ["yarn", "serve"]

# ENV HOME=/home/app

# COPY package.json yarn.lock ${HOME}/node_docker/

# WORKDIR ${HOME}/node_docker

# RUN yarn && yarn cache clean

# COPY . ${HOME}/node_docker

# CMD ["yarn", "build"]

# # set working directory
# WORKDIR /app

# # add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# # install and cache app dependencies
# COPY package.json /app/package.json
# RUN npm install
# RUN npm install @vue/cli@3.7.0 -g

# # start app
# CMD ["npm", "run", "serve"]



