Title: mod_mbox - Mailing list archives browser
license: https://www.apache.org/licenses/LICENSE-2.0

# Reference documentation #

In order to run properly, `mod_mbox` needs some configuration. Here follows
a list and description of all configuration directives understood by
`mod_mbox`.

# MboxIndex Directive #

Activate `mod_mbox` index.

    MboxIndex On|Off

Setting this option to *On* will tell `mod_mbox` to handle directory
listing. This will display a nice web page with mailing list information,
links to each month and the message count for each mailbox.

Default is *Off* 

# MboxRootPath Directive #

Set archives root directory.

    MboxRootPath /archives/

Specify the mail archives root directory, relative to webserver's
`DocumentRoot`. When set, `mod_mbox` will add *Site Index* link on
generated webpages, letting the user fall back to the list of mailing list
archives hosted on the server.

# MboxStyle Directive #

Set archives stylesheet file.

    MboxStyle /archives/style.css

When set, `mod_mbox` will use this stylesheet file. The path is relative to
the webserver's `DocumentRoot`. This is highly recommended since the
dynamic browser won't work as expected without a correct stylesheet.

The ASF's default stylesheet is bundled with `mod_mbox` sources and
releases. Using it is generally a good start.

# MboxScript Directive #

Set `mod_mbox` 's javascript file.

    MboxScript /archives/archives.js

When set, you will be able to use `mod_mbox` 's dynamic browsing interface,
an AJAX (Asynchronous Javascript and XML) application. A working javascript
file is bundled with `mod_mbox` , don't forget to copy it if you want to
use it !

# MboxHideEmpty Directive #

Hide empty mailboxes from index listing.

    MboxHideEmpty On|Off

This directive tells `mod_mbox` to hide empty (with zero message) mailboxes
from his index listings.

Default is *On* 

# MboxAntispam Directive #

Enable email obfuscation.

    MboxAntispam On|Off

This directive tells `mod_mbox` to enable a content-destructive email
obfuscation, thus avoiding spam to mailing list users. For exemple,
`localpart@localdomain.com` will be converted to
`localp...@localdomain.com`.

Default is *On* 

