# Certbot Route-53 Automatic Thingy Doer
----------------------------------------

Setup a Hosted Zone in Route 53, and get the hosted zone resource string.


Create IAM user/role with the following permissions:
- ListHostedZones (list)
- GetChange (list)
- ChangeResourceRecordSets (write) to hosted zone resource

May require installing the cryotography package >=2.8
`pip3 install cryptography>=2.8`

