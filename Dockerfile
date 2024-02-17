FROM node:alpine as build 

WORKDIR /app

COPY package.json /app/

RUN npm install 

COPY . .

# ghady tbuildi lina angular bundle li ghady nl9awh f /app/dist 
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/angularproject/ /usr/share/nginx/html

RUN cp -a  /usr/share/nginx/html/browser/* /usr/share/nginx/html/  
RUN rm -r /usr/share/nginx/html/browser 









