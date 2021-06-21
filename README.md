# devops



1.System design concerns:
1）High availability: Please make it highly available and no single point of failure.
后端服务启用多节点，前端配置nginx代理，通过负载均衡实现高可用。
2）Scalability : Please make it scalable.
通过docker容器发布，实现可拓展伸缩服务
3）Scaling target: 1000+ req/s, after scaling-up/out without major code change
fastapi 异步实现高并发访问

2.Tech stack
语言：python>=3.6
web框架：fastapi
database:mysql
系统：linux
cache：redis

3.Deliverable & Documentation
3.1 安装
pip install -r requestment.txt
3.2 启动服务
python3 main.py
或
uvicorn main:app --host 0.0.0.0 --port 8000 
3.3 ci/cd
docker build dockerFile
通过jenkins进行编译打包，然后推送image仓库，发布通过k8s进行发布
3.4 说明



