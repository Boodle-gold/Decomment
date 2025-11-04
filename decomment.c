#include <stdio.h>
#include <ctype.h>

/*
 * Comment Removal Program (or a Decomment program as the assignment says!) 
 *
 * Reads C source code from standard input and writes a version
 * with comments removed to standard output. 
 *
 * Implements a Deterministic Finite Automaton (DFA) to 
 * distinguish between normal code, string literals, character literals,
 * comments, and escaped characters. It also indentifies unterminated
 *  comments and prints them to standard error with the line number that 
 * the comment originated at.
 */

/*
 * Enumeration of possible states in the finite state machine.
 */
enum Statetype {
    NORMAL,               /* Processing normal text, ie: code or normal text */
    INCOMMENT,            /* Inside a comment */
    ENTERINGCOMMENT,      /* Saw '/', may be start of comment */
    EXITINGCOMMENT,       /* Saw '*', may be end of comment */
    INSTRINGLITERAL,      /* Inside a string literal */
    ESCAPEDCHARSTRING,    /* Inside an escaped char within string */
    ESCAPEDCHARCHARECTER, /* Inside an escaped char within char literal */
    INCHARLITERAL         /* Inside a character literal */
};

/*
 * Process input when in NORMAL state.
 * Recognizes possible comment starts, string literals,
 * or character literals. Otherwise prints character.
 */
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

/*
 * Process input when in ENTERINGCOMMENT state.
 * Determines whether '/' introduces //, /\*, or something else.
 * Updates line-tracking variable when entering a comment
 * in case of an unterminated comment.
 */
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


/*
 * Process input when inside a comment.
 * Looks for '*' that may indicate the start of a comment end.
 */
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

/*
 * Process input when potentially exiting a comment.
 * Recognizes '\/' as the actual end of comment.
 */
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

/*
 * Process input when inside a character literal.
 * Handles escapes and closing quote.
 */
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

/*
 * Process input when inside a string literal.
 * Handles escapes and closing quote.
 */
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

/*
 * Process input when inside an escaped character within string.
 */
enum Statetype handleEscapedCharString(int c) {
    enum Statetype state;
    putchar(c);
    state = INSTRINGLITERAL;
    return state;
}

/*
 * Process input when inside an escaped character within char literal.
 */
enum Statetype handleEscapedCharCharecter(int c) {
    enum Statetype state;
    putchar(c);
    state = INCHARLITERAL;
    return state;
}


/*
 * Main program: reads characters from stdin, processes
 * them according to current state, and writes output to stdout.
 * and stderr if nessesary.
 */
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
        return 1;  /* The error code */
    } 
    return 0; /* The sucess code */
}