Title: mod_mbox - Mailing list archives browser
license: https://www.apache.org/licenses/LICENSE-2.0

# Installation instructions #

`mod_mbox` is very easy to install and setup. First, we need to build the
module and make the Apache HTTPd webserver load it. Then, we'll setup our
archives repository and complete Apache's configuration.

`mod_mbox` has, of course, some requirements :

- Apache HTTPd &gt;= 2.0 ( `mod_mbox` has been tested succesfully with
Apache 2.0.55, 2.2.0 and 2.3.0-dev)

- APR and APR-Util &gt;= 0.9

- APR-Util with Berkeley DB 4 capability

# Download and build #

You can download a source tarball or checkout sources via Subversion :

    svn checkout https://svn.apache.org/repos/asf/httpd/mod_mbox/trunk
    mod_mbox

Then, build `mod_mbox` :

    ./autogen.sh
    ./configure --enable-experimental-libtool --with-apxs=`which apxs`
     make clean all
     su -c 'make install'

Refer to the configure help ( `./configure --help` ) if you need a to
specify an installation prefix ( `--prefix=...` ) or any other specific
setup.

# Preliminary Apache setup #

The next step is to make Apache HTTPd load the `mod_mbox` module at
runtime. Edit your Apache configuration file, and add the following to the
rest of the `LoadModule` lines :

    LoadModule mbox_module /usr/lib/apache2/modules/mod_mbox.so

# Repository setup #

`mod_mbox` is a mail archive browser. Having mail archives to browse would
be a good idea. For the following steps, we'll assume that you have a
directory (let's call it `foo` ) with your `.mbox` files. You must have a
`.mbox` file per month and each of them must be named in a `YYYYMM.mbox`
manner.

`mod_mbox` needs a static preprocessing of the archives before being able
to run. For that, we'll use the tool `mod-mbox-util` that was compiled with
the module itself at build time :

    mod-mbox-util -v -c foo/

**Don't forget to run `mod-mbox-util` each time you update your `.mbox`
files !** 

If you haven't done so yet, you must move your archives to a directory in
your Apache's `DocumentRoot` (or create a symbolic link to your directory
in it) :

    mkdir -p ~www-data/archives
    mv foo/ $_
    cp mod_mbox/docroot/* $_
    chown -R www-data:www-data $_

You can host multiple mailing list archives with `mod_mbox` , each stored
in a separate directory. If you are doing so, you should consider adding an
index file, displaying a list of all hosted archives.

# mod_mbox configuration #

The last thing you need to do in order to get your `mod_mbox` up and
running is to configure Apache so that it will call `mod_mbox` when trying
to read a `.mbox` file. The following configuration snippet is a good start:

    AddHandler mbox-handler.mbox
    <LocationMatch /archives/([^/]+)>
	MboxIndex On
	MboxRootPath "/archives/"
	MboxStyle "/archives/style.css"
	MboxScript "/archives/archives.js"
	MboxHideEmpty On
	MboxAntispam On
    </LocationMatch>

Please refer to the configuration directives [reference](ref.html) for more
information on these directives.

