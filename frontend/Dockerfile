FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./my-app .   # Adjusted path to correctly copy from 'my-app' directory
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]
