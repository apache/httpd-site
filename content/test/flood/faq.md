Title: Flood
flood: nav
license: https://www.apache.org/licenses/LICENSE-2.0

# Frequently Asked Questions  {#Questions}

-  [What is Flood?](#WhatIsFlood) 

-  [What are some of the features of Flood?](#FloodFeatures) 

-  [How does Flood retrieve variables from pages?](#FloodRegex) 

-  [Can I use Flood with SSL sites?](#FloodSSL) 

-  [Flood seems like it is stalling.](#TCPFIN) 

# What is Flood?  {#WhatIsFlood}

Flood is a profile-driven HTTP load tester. In layman's terms, it means
that flood is capable of generating large amounts of web traffic. Flood's
flexibility and power arises in its configuration syntax. It is able to
work well with dynamic content.

# What are some of the features of Flood?  {#FloodFeatures}

- XML-based configuration

- Able to set and retrieve variables from pages

- Uses threads and processes intelligently to scale

- Works with SSL

# How does Flood retrieve variables from pages?  {#FloodRegex}

Flood's configuration syntax allows for regular expression matching to
isolate values in a page.

Consider placing an order on a website. You add the order and you know that
the order confirmation page has the following format:
`"Order XYZZY placed successfully."` 
By using the following semantics, flood can store XYZZY into the OrderID
variable:
`responsetemplate="Order ([^ ]*) placed successfully"
responsename="OrderID"` 
In a subsequent request, you can use this OrderID variable in any template
variable:
`requesttemplate="https://localhost/getOrderStatus?orderId=$  {orderID}"` 
This will send the following request:
`https://localhost/getOrderStatus?orderId=XYZZY` 

# Can I use Flood with SSL sites?  {#FloodSSL}

Yes. However, due to export regulations and laws, Flood does not have SSL
support enabled by default. When configuring flood, you must pass the
`--enable-ssl` flag. Flood currently works with OpenSSL.

# Flood seems like it is stalling.  {#TCPFIN}

Your TCP implementation may have run out of ephemeral ports. Please consult
your operating systems' manuals on how to decrease the FIN timeout.

