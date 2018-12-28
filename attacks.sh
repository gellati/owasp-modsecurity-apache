BASEURL=http://172.17.0.2


# activated at paranoia level 4


# activated at paranoia level 3



# activated at paranoia level 2

# rule 9142050, 920350, 942100, 942110, 942180, 942330, 942390, 949110, 980130
# curl '%{http_code}' "$BASEURL/foo?username=1'%20or%20'1'%20=%20'"

# rule 9142050, 920350, 941100, 941110, 941160, 941320, 942110, 942130, 942260, 949110, 980130
# curl $BASEURL'/?q="><script>alert(1)</script>'

# rule 942110, 942100, 942180, 942330, 942390
# curl "$BASEURL/?q='1 OR 1=1"

# activated at paranoia level 1
# rule 930100, 930110, 949110, 980130
curl "$BASEURL/aphpfilethatdonotexist.php?something=../../etc"
