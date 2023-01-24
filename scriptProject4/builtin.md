# Basic calc

type -a bc 

bc -- a basic calculator function 

OR

awk 'BEGIN {print 6/4}'

# user delete , Disabling linux Accounts

userdel

which userdel

locate userdel

locate userdel | grep bin

# Find Command 

find /path/ -name filename 

example :- 

find /usr/bin/ -name userdel

# To run the recent the command 

!! (BANG BANG)

# man userdel

tail /etc/passwd

id -u username

# The User details are as follows 

vi /etc/login.defs


# Archives with tar

type -a tar

man tar

1.``` tar -cf file.tar /dir```  (cf -c create , -f file)

2.```tar -tf file.tar``` (tf -t to list , -f file)

3.```tar -cvf file.tar /dir``` (cvf -c create , -v verbose , -f file)

4.```tar -xf /file.tar``` (xf -x extract, -f file )

5.```tar -xvf filename.tar``` (xvf -x extract, -v verbose , -f file)

6.```tar -cvf file.tar /dir``` (cvf -c create , -v verbose , -f file)

# GUNZIP

1.```gzip filename.tar``` -> creates .tar.zip

2.```gunzip filename.tar.gz``` -> to revert back to .tar 

3.```tar -zcvf filename /path``` (zcvf , -z zip , -c create , -v verbose , -f file)

# .tar.gz = .tgz

4.```tar -zxvf /filename.tgz```

# Pre command from the terminal 

!$ (also called Vent designator)

# Disabling Account

man chage (change the age of expiration of the linux user)

```-E expiredate EXPIRE_DATE```

```sudo chage -E 0 username``` (lock the account)

```sudo change -E -1 username``` (unlock the account)

# Lock the account using the passwd command 

```sudo passwd -l username```

```sudo passwd -u username```

# Lock the account using usermod shells

cat /etc/shells

- nologin

```sudo usermod -s /sbin/nologin username```



