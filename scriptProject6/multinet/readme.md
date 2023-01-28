# SSH  command's to interact with remote machine
1.```ssh-copy-id server01```
2.```ssh-copy-id server02```

3.```ssh server01 hostname```
4.```ssh server02 hostname```

5.```for N in 1 2
     do
        ssh server0${N} hostname
     done```

6.```for SERVER in $(cat servers)
     do
        ssh ${SERVER} hostname
        ssh ${SERVER} uptime
     done```

7.```ssh server01 "${CMD};${CMD2}"```
8.```ssh server01 'ps -ef | head -3'```
9.```ssh server01 'false|true'```
10.```ssh server01 'set-o pipefail; false | true'```
