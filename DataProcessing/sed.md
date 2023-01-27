# Sed  Stream Editor 

- A stream is a data that travels from 
    - one process to another through a pipe
    - one file to another as redundant 
    - one deliver to another

Standard Input = Standard Input Stream, etc

Streams are typically textual data

sed performs text transformations on streams

Examples 
    - Substitute some text for other text 
    - Remove lines
    - Append text after given lines
    - Insert text before certain lines
sed is used for programmatically not interactively 

0.```sed 's/Search-Pattern/replace-Next-String/flags' filename```

1.```type -a sed```
2.```man sed```
3.```sed 's/assistant/assistant to the/' manager.txt```

For case sensitve (-i,I flag)
4.```sed 's/Manager/Director/i' manager.txt```

For Global subsitute (g flag) only first accurance of the word in each line + specify the numbers for specifc subsitute
5.```sed 's/assistant/professinal/' manager.txt```

- i For inplace editing and for backup
6.```sed -i.bak 's/assistant/professional/' manager.txt```
7.```sed 's/assistant/professional/ manager.txt' > edited_manager.txt```


# Replace special character 

/ -> \/ 
#/# -> /
:/: -> /

1.```echo '/home/azim' | sed 's/\/home\/azim/\/export\/usr\/azim/'```
2.```echo '/home/azim' | sed 's:/home/azim:/export/usr/azim:'```
3.```echo '/home/azim' | sed 's#/home/azim#/export/usr/azim#'```

4.```sed '/^#/d' config```
5.```sed '/^#/d;/^$/d' config```

For eleminating blank line - ^$
6.```sed -e '/^#/d' -e '/^$/d' -e 's/apache/httpd/' config```

For running the sed command form the script 
7.```sed -f script.sed config```

8.```sed '2 s/apache/httpd/' config```
9.```sed '/Group/ s/apache/httpd/' config```

For specific line numbers
10.```sed '1,3 s/run/execute/' config```
11.```sed '1,4 s/run/execute/' config```
12.```sed '/#User/ , /^$/ s/run/execute/' config```



