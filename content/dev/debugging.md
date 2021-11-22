Title: Apache HTTPD Debugging Guide
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache Debugging Guide

This document is a collection of notes regarding tools and techniques for
debugging Apache httpd and its modules.

Got more tips? Send 'em to
[docs@httpd.apache.org](mailto:docs@httpd.apache.org). Thanks!

1.  [Using gdb](#gdb) 

1.  [Getting a live backtrace on unix](#backtrace) 

1.  [Getting a live backtrace on Windows](#backtrace-win) 

1.  [Debugging intermittent crashes](#crashes) 

1.  [Using truss](#truss) 

1.  [Getting the server to dump core](#gcore) 

1.  [Solaris and coredumps](#sol27) 

1.  [Getting and analyzing a TCP packet trace](#tcpdump) 

# Using gdb  {#gdb}

If you use the gcc compiler, it is likely that the best debugger for your
system is gdb. This is only a brief summary of how to run gdb on Apache --
you should look at the info and man files for gdb to get more information
on gdb commands and common debugging techniques. Before running gdb, be
sure that the server is compiled with the `-g` option in `CFLAGS` to
include the symbol information in the object files.

The only tricky part of running gdb on Apache is forcing the server into a
single-process mode so that the parent process being debugged does the
request-handling work instead of forking child processes. We have provided
the `-X` option for that purpose, which will work fine for most cases.
However, some modules don't like starting up with `-X` , but are happy if
you force only one child to run (using " `MaxClients 1` "); you can then
use gdb's attach command to debug the child server.

The following example, with <font color="green">user input in green</font>,
shows the output of gdb run on a server executable (httpd) in the current
working directory and using the server root of `/usr/local/apache` :

<pre>
    % <font color="green">gdb httpd</font>
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for
    details.
    GDB 4.16.gnat.1.13 (sparc-sun-solaris2.5), 
    Copyright 1996 Free Software Foundation, Inc...
    (gdb) <font color="green">b ap_process_request</font>
    Breakpoint 1 at 0x49fb4: file http_request.c, line 1164.
    (gdb) <font color="green">run -X -d /usr/local/apache</font>
    Starting program: /usr/local/apache/src/httpd -X -d /usr/local/apache

    [ at this point I make a request from another window ]

    Breakpoint 1, ap_process_request (r=0x95250) at http_request.c:1164
    1164	if (ap_extended_status)
    (gdb) <font color="green">s</font>
    1165	   
    ap_time_process_request(r-&gt;connection-&gt;child_num,...
    (gdb) <font color="green">n</font>
    1167	process_request_internal(r);
    (gdb) <font color="green">s</font>
    process_request_internal (r=0x95250) at http_request.c:1028
    1028	if (!r-&gt;proxyreq &amp;&amp; r-&gt;parsed_uri.path)  {
    (gdb) <font color="green">s</font>
    1029	    access_status = ap_unescape_url(r-&gt;parsed_uri.path);
    (gdb) <font color="green">n</font>
    1030	    if (access_status)  {
    (gdb) <font color="green">s</font>
    1036	ap_getparents(r-&gt;uri);     /* OK...
    (gdb) <font color="green">n</font>
    1038	if ((access_status = location_walk(r)))  {
    (gdb) <font color="green">n</font>
    1043	if ((access_status = ap_translate_name(r)))  {
    (gdb) <font color="green">n</font>
    1048	if (!r-&gt;proxyreq)  {
    (gdb) <font color="green">n</font>
    1053	    if (r-&gt;method_number == M_TRACE)  {
    (gdb) <font color="green">n</font>
    1062	if (r-&gt;proto_num &gt; HTTP_VERSION(1,0) &amp;&amp;
    ap_...
    (gdb) <font color="green">n</font>
    1071	if ((access_status = directory_walk(r)))  {
    (gdb) <font color="green">s</font>
    directory_walk (r=0x95250) at http_request.c:288
    288 	core_server_config *sconf = ap_get_module_...
    (gdb) <font color="green">b ap_send_error_response</font>
    Breakpoint 2 at 0x47dcc: file http_protocol.c, line 2090.
    (gdb) <font color="green">c</font>
    Continuing.

    Breakpoint 2, ap_send_error_response (r=0x95250, recursive_error=0)
	at http_protocol.c:2090
    2090	BUFF *fd = r-&gt;connection-&gt;client;
    (gdb) <font color="green">where</font>
    #0	ap_send_error_response (r=0x95250, recursive_error=0)
	at http_protocol.c:2090
    #1	0x49b10 in ap_die (type=403, r=0x95250) at http_request.c:989
    #2	0x49b60 in decl_die (status=403, phase=0x62db8 "check access",
    r=0x95250)
	at http_request.c:1000
    #3	0x49f68 in process_request_internal (r=0x95250) at
    http_request.c:1141
    #4	0x49fe0 in ap_process_request (r=0x95250) at http_request.c:1167
    #5	0x439d8 in child_main (child_num_arg=550608) at http_main.c:3826
    #6	0x43b5c in make_child (s=0x7c3e8, slot=0, now=907958743)
	at http_main.c:3898
    #7	0x43ca8 in startup_children (number_to_start=6) at http_main.c:3972
    #8	0x44260 in standalone_main (argc=392552, argv=0x75800) at
    http_main.c:4250
    #9	0x449fc in main (argc=4, argv=0xefffee8c) at http_main.c:4534
    (gdb) <font color="green">s</font>
    2091	int status = r-&gt;status;
    (gdb) <font color="green">p status</font>
    $1 = 403
    (gdb) 
</pre>

There are a few things to note about the above example:

1. the " `gdb httpd` " command does not include any command-line options
for httpd: those are provided when the " `run` " command is done within
gdb;

1. I set a breakpoint before starting the run so that execution would stop
at the top of ap_process_request();

1. the " `s` " command steps through the code and into called procedures,
whereas the " `n` " (next) command steps through the code but not into
called procedures.

1. additional breakpoints can be set with the " `b` " command, and the run
continued with the " `c` " command.

1. use the " `where` " command (a.k.a. " `bt` ") to see a stack backtrace
that shows the order of called procedures and their parameter values.

1. use the " `p` " command to print the value of a variable.

A file in the the root directory called `.gdbinit` provides useful macros
for printing out various internal structures of httpd like tables (
`dump_table` ), brigades ( `dump_brigade` ) and filter chains (
`dump_filters` ).

If you are debugging a repeatable crash, simply run gdb as above and make
the request -- gdb should capture the crash and provide a prompt where it
occurs.

If you are debugging an apparent infinite loop, simply run gdb as above and
type a Control-C -- gdb will interrupt the process and provide a prompt
where it was stopped.

If you are debugging a system crash and you have a core file from the
crash, then do the following:

```
    % gdb httpd -c core
    (gdb) where
```

and it will (hopefully) print a stack backtrace of where the core dump
occurred during processing.

# Getting a live backtrace on unix  {#backtrace}

A backtrace will let you know the hierarchy of procedures that were called
to get to a particular point in the process. On some platforms you can get
a live backtrace of any process.

For SVR4-based variants of Unix, the `pstack` command for proc can be used
to display a a live backtrace. For example, on Solaris it looks like

```
    % /usr/proc/bin/pstack 10623
    10623:  httpd -d /usr/local/apache
     ef5b68d8 poll     (efffcd08, 0, 3e8)
     ef5d21e0 select   (0, ef612c28, 0, 0, 3e8, efffcd08) + 288
     00042574 wait_or_timeout (0, 75000, 75000, 7c3e8, 60f40, 52c00) + 78
     00044310 standalone_main (5fd68, 75800, 75c00, 75000, 2, 64) + 240
     000449f4 main     (3, efffeee4, efffeef4, 75fe4, 1, 0) + 374
     000162fc _start   (0, 0, 0, 0, 0, 0) + 5c
```

Another technique is to use gdb to attach to the running process and then
using "thread apply all bt" to print the backtrace, as in:

```
sudo gdb /path/to/bin/httpd 10623 --batch --eval-command "where" --eval-command "thread apply all bt" --eval-command "detach"  --eval-command "quit" | tee gdb-output.txt
```

Or interactively:

```
    % gdb httpd 10623
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for
    details.
    GDB 4.16.gnat.1.13 (sparc-sun-solaris2.5), 
    Copyright 1996 Free Software Foundation, Inc...

    /usr/local/apache/src/10623: No such file or directory.
    Attaching to program `/usr/local/apache/src/httpd', process 10623
    Reading symbols from /usr/lib/libsocket.so.1...done.
    ...
    0xef5b68d8 in   ()
    (gdb) where
    #0	0xef5b68d8 in	()
    #1	0xef5d21e8 in select ()
    #2	0x4257c in wait_or_timeout (status=0x0) at http_main.c:2357
    #3	0x44318 in standalone_main (argc=392552, argv=0x75800) at...
    #4	0x449fc in main (argc=3, argv=0xefffeee4) at http_main.c:4534
    (gdb) thread apply all bt
    (gdb) detach
    (gdb> quit
```

# Getting a live backtrace on Windows  {#backtrace-win}

1. Unzip the `-symbols.zip` files (obtained from the Apache download site)
in the root Apache2 directory tree (where bin\, htdocs\, modules\ etc. are
usually found.) These.pdb files should unpack alongside the.exe,.dll,.so
binary files they represent, e.g., mod_usertrack.pdb will unpack alongside
mod_usertrack.so.

1. Optional: Obtain `procdump` from Sysinternals.

1. Invoke `drwtsn32` and ensure you are creating a crash dump file, you are
dumping all thread contexts, your log and crash dump paths make sense, and
(depending on the nature of the bug) you pick an appropriate crash dump
type. (Full is quite large, but necessary sometimes for a programmer-type
to load your crash dump into a debugger and begin unwinding exactly what
has happened. Mini is sufficient for your first pass through the process.)

   You can use `procdump` or `procdump -ma` at this stage instead.

1. Note that if you previously installed and then uninstalled other
debugging software, you may need to invoke `drwtsn32 -i` in order to make
Dr Watson your default crash dump tool. This will replace the 'report
problem to MS' dialogs. (Don't do this if you have a full debugger such as
Visual Studio or windbg installed on the machine, unless you back up the
registry value for `Debugger` under the `HKLM\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\AeDebug` registry tree. Developers using multiple tools
might want to keep copies of their different tools Debugger entries there,
for fast switching.)

1. Invoke the Task Manager, Choose 'show processes from all users', and
modify the `View -&gt; Select Columns` to include **at least** the `PID`
and `Thread
   Count`. You can change this just once and Task Manager should keep your
   preference.

1. Now, track down the errant Apache that is hanging. The parent process
has about three threads, we don't care about that one. The child worker
process we want has many more threads (a few more than you configured with
the ThreadsPerChild directive.) The process name is Apache (for 1.3 and
2.0) or httpd (for 2.2 and 2.4). Make note of the child worker's PID.

1. Using the  {pid} number you noted above, invoke the command
> `drwtsn32 -p  {pid}` 
or
> `procdump {pid}`


Voila, you will find in your 'log file path' a `drwtsn32.log` file, and if
you choose to 'append to existing log file', jump through the 'App:'
sections until you find the one for the process you just killed. Now you
can identify about where 'Stack Back Trace' points to help identify what
the server is doing.

You will note that many threads look identical, almost all of them polling
for the next connection, and you don't care about those. You will want to
see the ones that are deep inside of a request at the time you kill them,
and only the stack back trace entries for those. This can give folks a clue
of where that request is hanging, which handler module picked up the
request, and what filter it might be stuck in.

# Debugging intermittent crashes  {#crashes}

For situations where a child process is crashing intermittently, the server
must be configured and started such that it produces core dumps which can
be analyzed further.

To ensure that a core dump is written to a directory which is writable by
the user which child processes run as (such as `apache` ), the
[](http://httpd.apache.org/docs/current/mod/mpm_common.html#coredumpdirectory)
directive must be added to `httpd.conf` ; for example:
```
   CoreDumpDirectory /tmp
```
Before starting up the server, any process limits on core dump file size
must be lifted; for example:
```
  # ulimit -c unlimited
  # apachectl start
```
On some platforms, further steps might be needed to enable core dumps - see
[Solaris and coredumps](#sol27) below.

When a child process crashes, a message like the following will be logged
to the error_log:

```
[Mon Sep 05 13:35:39 2005] [notice] child pid 2027 exit signal Segmentation
fault (11), possible coredump in /tmp
``` 

If the text "possible coredump in /tmp" does not appear in the error line,
check that the ulimit was set correctly, that the permissions on the
configured `CoreDumpDirectory` are suitable and that platform specific
steps ( [Solaris and coredumps](#sol27) ) have been done if needed.

To analyse the core dump, pass the core dump filename on the gdb
command-line, and enter the command `thread apply all bt full` at the gdb prompt:

```
    % gdb /usr/local/apache2/bin/httpd /tmp/core.2027
    ...
    Core was generated by `/usr/local/apache2/bin/httpd -k start'
    ...
    (gdb) thread apply all bt full
```

# Using 'truss/trace/strace' to trace system calls and signals  {#truss}

Most Unix-based systems have at least one command for displaying a trace of
system calls and signals as they are accessed by a running process. This
command is called `truss` on most SVR4-based systems and either `trace` or
`strace` on many other systems.

A useful tip for using the `truss` command on Solaris is the `-f` option
(often also works with `strace` ); it tells truss to follow and continue
tracing any child processes forked by the main process. The easiest way to
get a full trace of a server is to do something like:

<pre>
    % truss -f httpd -d /usr/local/apache &gt;&amp; outfile
    % egrep '^10698:' outfile
</pre>

to view just the trace of the process id 10698.

If attempting to truss a threaded server, for example when using the
`worker` MPM, the `truss` option `-l` is very useful as it prints also the
LWP id after the process id. You can use something like

```
    % egrep '^10698/1:' outfile
```

to view just the trace of the process id 10698 and LWP id 1.

Other useful options for truss are

-  `-a` to print all command line parameters used for this executable.

-  `-e` to print all environment variables used for this executable.

-  `-d` to print timestamps.

# Getting the server to dump core  {#gcore}

Strangely enough, sometimes you actually want to force the server to crash
so that you can get a look at some nutty behavior. Normally this can be
done simply by using the `gcore` command. However, for security reasons,
most Unix systems do not allow a setuid process to dump core, since the
file contents might reveal something that is supposed to be protected in
memory.

Here is one way to get a core file from a setuid Apache httpd process on
Solaris, without knowing which httpd child might be the one to die [note:
it is probably easier to use the MaxClients trick in the first section
above].

<pre>
    # for pid in `ps -eaf | fgrep httpd | cut -d' ' -f4`
    do
      truss -f -l -t\!all -S SIGSEGV -p $pid 2&gt;&amp;1 | egrep SIGSEGV
      &amp;
    done
</pre>

The [undocumented '-S'
flag](http://www.dejanews.com/=zzz_maf/getdoc.xp?AN=352257973) to truss
will halt the process in place upon receipt of a given signal (SIGSEGV in
this case). At this point you can use:

```
    # gcore PID
```

and then look at the backtrace as discussed above for [gdb](#gdb).

# Solaris and coredumps  {#sol27}

On Solaris use [](http://docs.sun.com/app/docs/doc/816-5166/coreadm-1m) to
make `setuid()` processes actually dump core. By default a `setuid()` process
does not dump core. This is the reason why httpd servers started as root
with child processes running as a different user (such as `apache` ) do not
coredump even when the
[CoreDumpDirectory](http://httpd.apache.org/docs/current/mod/mpm_common.html#coredumpdirectory)
directive had been set to an appropriate and writable directory and **`ulimit -c`** has a sufficient size.
See also [Debugging intermittent crashes](#crashes) above.

Example:

```
-bash-3.00# coreadm
    global core file pattern: /var/core/core.%f.%p.u%u
    global core file content: default
       init core file pattern: core
       init core file content: default
    global core dumps: disabled
       per-process core dumps: enabled
    global setid core dumps: enabled
per-process setid core dumps: enabled
    global core dump logging: disabled
```

# Getting and analyzing a TCP packet trace  {#tcpdump}

This is too deep a subject to fully describe in this documentation. Here
are some pointers to useful discussions and tools:

-  `snoop` is a packet sniffer that is part of Solaris.

-  [tcpdump](http://www.tcpdump.org/) is a packet sniffer that is available
for Unix-based systems and Windows (
[windump](http://www.winpcap.org/windump/) ). It is part of many free
Unix-based distributions.

-  [Wireshark](http://www.wireshark.org/) is another packet sniffer that is
available for Unix-based systems and Windows. It has a nice GUI and allows
the analysis of the sniffed data.

-  [tcptrace](http://jarok.cs.ohiou.edu/software/tcptrace/) is a TCP dump
file analysis tool.

-  [tcpshow](http://www.tcpshow.org/) is another one.
