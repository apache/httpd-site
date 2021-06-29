Title: Apache Developers' C Language Style Guide
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache Developers' C Language Style Guide

**Compiled by Paul Sutton [paul@awe.com](mailto:paul@awe.com)**. Based on
a vote taken in November, 1996.<br></br>Further refinements voted upon in
July 1997.

# Introduction #

[This bit could state that code should be laid out to be clear to someone
else familiar with Apache. Functions should be short and easily understood.
Comments should be provided to explain the rationale for code which is not
obvious, and to document behavior of functions. The guidelines can be
broken if necessary to achieve a clearer layout]

This style can be generated with the following arguments to GNU indent:

    -i4 -npsl -di0 -br -nce -d0 -cli0 -npcs -nfc1 -nut

# The Guidelines #

- Opening braces are given on the same lines as statements, or on the
following line at the start of a function definition.
- Code inside a block (whether surrounded by braces or not) is indented by
four space characters. Tab characters are not used. Comments are indented to
the same level as the surrounding code.
- Closing braces are always on a separate line from surrounding code, and are
indented to line up with the start of the text on the line containing the
corresponding opening brace.
- Functions are declared with ANSI-style arguments.
- There is no space between the function name and the opening bracket of the
arguments to the function. There is a single space following commas in
argument lists and the semi-colons in for statements.
- Inside a `switch()` statement, the `case` keywords are indented to the same
level as the `switch` line.
- Operators in expressions should be surrounded by a single space before and
after, except for unary increment (++), decrement (--), and negation (!) operators.
- There is no whitespace between a cast and the item modified (<EM>e.g.</EM>,
"<samp>(int)j</samp>" and not "<samp>(int) j</samp>").
- If a cast is to a pointer type, there is a space between the type and
the `*` character (*e.g.*, "`(char *)i`" instead of "`(char*)i`")

# Details and Examples #

##  **Indentation, General Style**

Each level of indentation of code is four spaces. Tab characters should
never be used. Specific indentation rules for function declarations and
control-flow keywords are given below.

Example:

    main(int argc, char **argc)
    {
	if (argc != 0)  {
	    fprintf(stderr, "No arguments allowed\n");
	    exit(1);
	}
	exit(0);
    }

<A NAME="long-exps">If an expression</A> (or a routine declaration or
invocation) would extend past column 80, the terms or arguments are wrapped
at a convenient spot and the wrapped portion is indented under the first
term in the expression (or the first argument to the function). Conditional
expressions should be wrapped to keep single or parenthesized terms as
atomic as possible, and place Boolean operators at either the start
(preferable) or end of the line.

Example:

     static const char *really_long_name(int i, int j,
                                         const char *args, void *foo,
                                         int k)

     if (cond1 && (item2 || item3) && (!item4)
         && (item5 || item6) && item7)  {
         do_a_thing();
     }


## **Comments** 

Provide comments which explain the function of code where it is not clear
from the code itself. Provide rationale where necessary for particular bits
of code.

Comments should be indented to same level as the surrounding text.

Example:

    code;
    /* comment */
    code;


## **Function Declaration and Layout** 

Functions are laid out as follows:

Example:

    int main(int argc, char **argv)
    {
        code;
    }

The return type is placed on the same line as the function. Arguments (if
any) are given in ANSI style. If no arguments, declare function as `void`.
No space between function name and opening bracket, single space after
comma separating each argument. The opening brace is placed on the line
after the definition, indented to line up with the start of the return type
text. The code is indented with four spaces, and the closing brace is
indented to line up with the opening brace. **Also see the section on
indenting <A HREF="#long-exps">long declarations and invocations</A>.** 

## **Function Calls** 

Space after commas in function calls. No space between function name and
opening bracket.

Example:

    f(a, b);

**Also see the section on indenting <A HREF="#long-exps">long declarations
and invocations</A>.** 

## **Flow-Control Layout** 

Flow-control statements (`if`, `while`, `for`, *etc.*) are laid out as in this

Example:

    if (expr)  {
        code;
    }
    else  {
        code;
    }

There is a space between the keyword and the opening bracket. Opening brace
placed on same line as the flow keyword. The code itself is indented by four
spaces. The closing brace is indented to line up with the opening brace. If
an `else` clause is used, the `else` keyword is placed on the line following
the closing brace and is indented to line up with the corresponding `if`.
**Also see the section on indenting <A HREF="#long-exps">long
expressions</A>.** 

## **`for` Layout** 

Space after the semi-colons.

Example:

    for (a; b; c)
 

## **`switch` Layout**

`case` lines within a `switch()` are indented to same level as the switch
statement itself. The code for each case is indented by four spaces.
Braces are laid out as for other control-flow keywords.

Example:

    switch (x)  {
    case a:
        code;
    case b:
        code;
    }


## **Expressions** 

Space before and after assignment and other and operators. No space between
unary operators (increment, decrement, and negation) and the lvalue.

Examples:

    a = b
    a + b
    a < b
    a = -b
    a = !b
    ++a
 

## **Capitalisation of Enums** 

No rule.

