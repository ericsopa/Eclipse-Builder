#!/bin/sed -f
1{x;p;g;}
s/</\&lt;/g
s/>/\&gt;/g
s/\"/\&quot;/g
s/'/\&apos;/g
