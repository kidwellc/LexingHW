%{
    #include <stdio.h>
	void printLexeme();
	int lineNum = 1;
%}
 
%%
 
end           { printf("END\n"); }				//END. This statement exits the interpreter.
;             { printf("END_STATEMENT\n");		//END_STATEMENT. All commands should end with a semicolon.
				lineNum++;}					  	//Increments line number.
point         { printf("POINT\n");}				//POINT. When we match the command to plot a point.
line          { printf("LINE\n");}				//LINE. When we match the command to draw a line.
circle        { printf("CIRCLE\n");}			//CIRCLE. When we match the command to draw a circle.
rectangle     { printf("RECTANGLE\n");}			//RECTANGLE. When we match the command to draw a rectangle.
set_color	  { printf("SET_COLOR\n");}			//SET_COLOR. Matches the command to change colors.
[0-9]+        { printf("INT\n"); }    			//INT. Matches an integer value.
\d+\.\d+      { printf("FLOAT\n"); }			//FLOAT. Matches a floating-point value.
\t|\s|\n      ; 								//A way to match tabs, spaces, or newlines, and to ignore them.

.		      { printf("Error Line %d: ", lineNum); printLexeme();} //Matches anything not listed above, and to tell the user they messed up, and on which line.
 
%%
void printLexeme(){
        printf("(%s)\n", yytext);
}
 
int main(int argc, char** argv){
  yylex();    // Start lexing!
  return 0;
}
