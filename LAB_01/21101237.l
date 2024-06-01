%option noyywrap

%{

#include<bits/stdc++.h>
using namespace std;

ofstream yyoutlog; //output filestream for log file

string loglist = ""; //list of tokens along with line numbers

// define necessary c++ variables and functions here (if any)
int lines=1; //to keep track of line numbers
//int tab=0;
%}


/* Regular Definitions */

delim [ \v\r]

/* write regular expressions for whitespace and newline */

ws  {delim}+

newline \r?\n

letter [a-zA-Z]
digit [0-9]

/* write regular expressions for id, float and integers */

id [a-zA-Z_][a-zA-Z_0-9]*
floats {digit}*\.{digit}+
integers {digit}+

%%

{ws} { /* ignore whitespace */ }

{newline} {

        /* do necessary bookkeeping (line number tracking etc.) */
        lines+=1;
    }

{floats} {
            loglist="Line No "+to_string(lines)+": Token <CONST_FLOAT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	
        }

{integers} {
            loglist="Line No "+to_string(lines)+": Token <CONST_INT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }

if {
	    loglist="Line No "+to_string(lines)+": Token <IF> Lexeme "+yytext+" found"+"\n"+"\n";
	    yyoutlog<<loglist;
	    
        }

else {
            loglist="Line No "+to_string(lines)+": Token <ELSE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	   
        }

for {
            loglist="Line No "+to_string(lines)+": Token <FOR> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }

range {
            loglist="Line No "+to_string(lines)+": Token <RANGE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	   
        }        

break {
            loglist="Line No "+to_string(lines)+": Token <BREAK> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }        

not {
            loglist="Line No "+to_string(lines)+": Token <NOT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }        

catch {
            loglist="Line No "+to_string(lines)+": Token <CATCH> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }               

try {
            loglist="Line No "+to_string(lines)+": Token <TRY> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	   
        }        

except {
            loglist="Line No "+to_string(lines)+": Token <EXCEPT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	
        }        

true {
            loglist="Line No "+to_string(lines)+": Token <TRUE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	  
        }        

false {
            loglist="Line No "+to_string(lines)+": Token <FALSE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	  
        }        

def {
            loglist="Line No "+to_string(lines)+": Token <DEF> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	  
        }        

return {
            loglist="Line No "+to_string(lines)+": Token <RETURN> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	  
        }        

finally {
            loglist="Line No "+to_string(lines)+": Token <FINALLY> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	   
        }        

while {
            loglist="Line No "+to_string(lines)+": Token <WHILE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	  
        }        

and {
            loglist="Line No "+to_string(lines)+": Token <AND> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }        

or {
            loglist="Line No "+to_string(lines)+": Token <OR> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }        

print {
            loglist="Line No "+to_string(lines)+": Token <PRINT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }        

in {
            loglist="Line No "+to_string(lines)+": Token <IN> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }        

continue {
            loglist="Line No "+to_string(lines)+": Token <CONTINUE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }        

pass {
            loglist="Line No "+to_string(lines)+": Token <PASS> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }        

none {
            loglist="Line No "+to_string(lines)+": Token <NONE> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }        

do {
            loglist="Line No "+to_string(lines)+": Token <DO> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }

{id} {
            loglist="Line no "+to_string(lines)+": Token <ID> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
	    
        }

"+"|"-" { /* to match two same operators use | */
	    loglist="Line No "+to_string(lines)+": Token <ADDOP> Lexeme "+yytext+" found"+"\n"+"\n";
	    yyoutlog<<loglist;
		}

"++"|"--" { /* to match two same operators use | */
	    loglist="Line No "+to_string(lines)+": Token <INCOP> Lexeme "+yytext+" found"+"\n"+"\n";
	    yyoutlog<<loglist;
		}

"<"|">"|"=="|"<="|">="|"!=" { /* to match two same operators use | */
	    loglist="Line No "+to_string(lines)+": Token <RELOP> Lexeme "+yytext+" found"+"\n"+"\n";
	    yyoutlog<<loglist;
		}

"=" { /* to match two same operators use | */
	    loglist="Line No "+to_string(lines)+": Token <ASSIGNOP> Lexeme "+yytext+" found"+"\n"+"\n";
	    yyoutlog<<loglist;
		}

"&&"|"||" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <LOGICOP> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}
"!" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <NOT> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}
"(" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <LPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}

")" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <RPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}
"{" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <LCURL> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}
"}" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <RCURL> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}

"[" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <LTHIRD> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}

"]" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <RTHIRD> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}
"," { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <COMMA> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}

":" { /* to match two same operators use | */
	     loglist="Line No "+to_string(lines)+": Token <COLON> Lexeme "+yytext+" found"+"\n"+"\n";
	     yyoutlog<<loglist;
		}

%%

int main(int argc, char *argv[])
{

	if(argc != 2) //check if file name is given
	{
        cout<<"Please input file name"<<endl;
		return 0;
	}

	yyin = fopen(argv[1], "r"); //the file to be read must be assigned to yyin

	yyoutlog.open("21101237.txt", ios::trunc); // remember to rename the log file as mentioned in the spec
	
	if(yyin == NULL) // file does not exist
	{
		// print error message and exit
	}
	
	yylex(); // start reading the input file in a loop
	
	//print total number of lines found in the input file

        loglist = "\n";
	yyoutlog<<loglist;       
	loglist = "Total lines = " + to_string(lines)+"\n";
	yyoutlog<<loglist;
        //loglist = "Total tab = " + to_string(tab);
	//yyoutlog<<loglist;
	yyoutlog.close(); // close the log file
	
	fclose(yyin); // close the input file
}