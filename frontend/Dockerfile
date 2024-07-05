FROM node:14-alpine
WORKDIR /app
COPY FrontEnd/my-app/package*.json ./
RUN npm install
COPY FrontEnd/my-app ./
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]
