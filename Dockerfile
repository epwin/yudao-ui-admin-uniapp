# 基于官方的Nginx镜像作为基础镜像
FROM nginx:latest

# 将本地的配置文件复制到镜像内的Nginx配置目录，这里假设你有自定义的Nginx配置文件，比如nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# 将前端构建后的静态文件（这里假设是dist目录下的内容）复制到Nginx的默认网页根目录中
COPY unpackage/dist/build/web /usr/share/nginx/html

# 暴露Nginx默认的80端口，方便外部访问
EXPOSE 80

# 定义容器启动时执行的命令，启动Nginx服务
CMD ["nginx", "-g", "daemon off;"]
