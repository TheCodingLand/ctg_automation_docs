FROM mambaorg/micromamba:0.20.0 as build-mkdocs
ENV ENV_NAME=mkdocs-3.10
COPY environment_python_3_10.yml .
RUN micromamba create --yes --file environment_python_3_10.yml
ARG MAMBA_DOCKERFILE_ACTIVATE=1
USER root
RUN apt update 
RUN apt install -y git build-essential
COPY . .
RUN mkdocs build -f ./mkdocs.insiders-pdf.yml



FROM nginx:alpine
COPY --from=build-mkdocs /tmp/site/ /usr/share/nginx/html
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]