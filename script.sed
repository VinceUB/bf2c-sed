#This removes all comments. It's supposed to remove newlines too but doesn't for some reason
s/[^][><,.+-]//g 
s/\
//g 

#The following just replaces all brainfuck commands with their C counterparts
s/\[/while(*p){/g 
s/]/}/g
s/+/++*p;/g
s/-/--*p;/g
s/\./putchar(*p);/g
s/,/*p=getchar();/g
s/</p--;/g
s/>/p++;/g

#Before first line, insert header
1i\
#include<stdio.h>\
#include<stdlib.h>\
int main(){\
char* p = (char*) calloc(100000000, sizeof(char));
#After last line, insert the }
$a\
}
