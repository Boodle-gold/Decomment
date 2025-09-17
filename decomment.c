#include <stdio.h>
#include <ctype.h>

enum Statetype {NORMAL, INCOMMENT, ENTERINGCOMMENT, EXITINGCOMMENT, INSTRINGLITERAL, ESCAPEDCHARSTRING, ESCAPEDCHARCHARECTER, INCHARLITERAL};

enum Statetype handleNormalState(int c) {
    enum Statetype state;
    if (c == '/') {
        state = ENTERINGCOMMENT;
    } else if (c == '\'') {
        putchar(c);
        state = INCHARLITERAL;
    } else if (c == '\"') {
        putchar(c);
        state = INSTRINGLITERAL;
    } else {
        putchar(c);
        state = NORMAL;
    }
    return state;
}

enum Statetype handleEnteringCommentState(int c, int *commentLineNumber, int *currentLineNumber) {
    enum Statetype state;
    if (c == '/') {
        putchar('/');
        state = ENTERINGCOMMENT;
    } else if (c == '*') {
        putchar(' ');
        *commentLineNumber = *currentLineNumber;
        state = INCOMMENT;
    } else if (c == '\''){
        putchar('/');
        putchar(c);
        state = INCHARLITERAL;
    } else if (c == '\"'){
        putchar('/');
        putchar(c);
        state = INSTRINGLITERAL;
    } else {
        putchar('/');
        putchar(c);
        state = NORMAL;
    }
    return state;
}

enum Statetype handleInCommentState(int c) {
    enum Statetype state;
    if (c == '\n') {
        putchar(c);
        state = INCOMMENT;
    } else if (c == '*') {
        state = EXITINGCOMMENT;
    } else {
        state = INCOMMENT;
    }
    return state;
}

enum Statetype handleExitingCommentState(int c) {
    enum Statetype state;
    if (c == '*') {
        state = EXITINGCOMMENT;
    } else if (c == '\n') {
        putchar(c);
        state = INCOMMENT;
    } else if (c == '/') {
        state = NORMAL;
    } else {
        state = INCOMMENT;
    }
    return state;
}

enum Statetype handleInCharLiteral(int c) {
    enum Statetype state;
    if (c == '\'') {
        putchar(c);
        state = NORMAL;
    } else if (c == '\\') {
        putchar(c);
        state = ESCAPEDCHARCHARECTER;
    } else {
        putchar(c);
        state = INCHARLITERAL;
    }
    return state;
}

enum Statetype handleInStringLiteral(int c) {
    enum Statetype state;
    if (c == '\\') {
        putchar(c);
        state = ESCAPEDCHARSTRING;
    } else if (c == '\"') {
        putchar(c);
        state = NORMAL;
    } else {
        putchar(c);
        state = INSTRINGLITERAL;
    }
    return state;
}

enum Statetype handleEscapedCharString(int c) {
    enum Statetype state;
    putchar(c);
    state = INSTRINGLITERAL;
    return state;
}

enum Statetype handleEscapedCharCharecter(int c) {
    enum Statetype state;
    putchar(c);
    state = INCHARLITERAL;
    return state;
}

int main(void) {
    int c;
    enum Statetype state = NORMAL;
    int lineNumber = 1;
    int commentLineNumber = 1;
    while ((c = getchar()) != EOF) {
        if(c == '\n') lineNumber++;
        switch (state)
        {
        case NORMAL:
            state = handleNormalState(c);
            break;
        case ENTERINGCOMMENT:
            state = handleEnteringCommentState(c, &commentLineNumber, &lineNumber);
            break;
        case INCOMMENT:
            state = handleInCommentState(c);
            break;
        case EXITINGCOMMENT:
            state = handleExitingCommentState(c);
            break;
        case INSTRINGLITERAL:
            state = handleInStringLiteral(c);
            break;
        case ESCAPEDCHARSTRING:
            state = handleEscapedCharString(c);
            break;
        case INCHARLITERAL:
            state = handleInCharLiteral(c);
            break;
        case ESCAPEDCHARCHARECTER:
            state = handleEscapedCharCharecter(c);
            break;
        }
    } 
    if (state == ENTERINGCOMMENT) {
        putchar('/');
    }
    if (state == INCOMMENT || state == EXITINGCOMMENT) {
        fprintf(stderr, "Error: line %d: unterminated comment\n", commentLineNumber);
        return 1;
    } 
    
    return 0;
}