To create and start app please

1) install Docker version 1.12.3 or higher

2) install whaler from https://github.com/whaler

3) install haproxy plugin for whaler from https://github.com/whaler

4) run from project folder:
whaler init
whaler start

5) whaler domains:publish terr.loc your_app_name
where your_app_name is generally your project folder name
you can also run 'whaler status' to see ips and containers of your application
it will display like:
mysql.your_app_name xxx.xxx.xxx.xxx
apachephp.your_app_name xxx.xxx.xxx.xxx

6) update your /etc/hosts with apachephp container ip and terr.loc as domain
will be something like
172.17.0.20 terr.loc

7) open browser on http://terr.loc

8) PROFIT