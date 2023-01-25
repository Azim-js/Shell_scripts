# CUT command 

```man cut```

-b, --bytes=LIST
-c, --characters=LIST
-d, --delimiter=DELIM
-f, --fields=LIST

To get the n characters of all the lines 

1.```cut -c 1 /etc/passwd```
2.```cut -c 7 /etc/passwd```
3.```cut -c 4-7 /etc/passwd```
4.```cut -c 4- /etc/passwd```
5.```cut -c 1-4 /etc/passwd```
6.```cut -c 1,3,5 /etc/passwd```
7.```cut -c 5,3,1 /etc/passwd```
8.```cut -c 9999 /etc/passwd`` if The Character isnt present then it will not return anything

1.```cut -b 1 /etc/passwd```
2.```echo "ñu" | cut -c 1```
3.```echo "ñu" | cut -b 1```

# Field formating  (d -> Delimiter)

1.```echo -e 'one\two\three' | cut -f 1```
2.```echo -e 'one\two\three' | cut -d '\' -f 2```
3.```echo -e 'one\two\three' | cut -d ',' -f 3```
4.```cut -d ':' -f 1,3 /etc/passwd```
5.```cut -d ':' -f 1,3 --output-delimiter=','```

# To extract the pattern with the delimiter

6.```cut -d ',' -f 1 people.csv```


# GREP Command (grep matches the pattern given)

1.```grep first people.csv```
2.```grep 'first,last' people.csv```
3.```grep '^first' people.csv```
4.```grep 't$' people.csv```
5.```grep '^first,last$' people.csv```

# -v reg exp selects the opp of the defined partten

1.```grep -v '^first,last$' people.csv```
2.```grep -v '^first,last$' people.csv | cut -d ',' -f 1 ```
3.```cut -d ',' -f1 people.csv | grep -u '^first$'```

