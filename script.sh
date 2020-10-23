# by iradium#0009

#! /bin/bash


# Allow established sessions to receive traffic
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Create the ipset list
ipset -N france hash:net
ipset -N canada hash:net
ipset -N belgique hash:net
ipset -N martinique hash:net
ipset -N maurice hash:net
ipset -N guyane hash:net
ipset -N mayotte hash:net
ipset -N maroc hash:net
ipset -N algerie hash:net
ipset -N tunisie hash:net
ipset -N luxembourg hash:net
ipset -N caledonie hash:net
ipset -N suisse hash:net
ipset -N guadeloupe hash:net
ipset -N reunion hash:net


# remove any old list that might exist from previous runs of this script
rm fr.zone
rm ca.zone
rm be.zone
rm mq.zone
rm mu.zone
rm gf.zone
rm yt.zone
rm ma.zone
rm dz.zone
rm tn.zone
rm lu.zone
rm nc.zone
rm ch.zone
rm gp.zone
rm re.zone


# Pull the latest IP set for China
wget -P . http://www.ipdeny.com/ipblocks/data/countries/fr.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/ca.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/be.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/mq.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/mu.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/gf.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/yt.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/ma.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/dz.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/tn.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/lu.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/nc.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/ch.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/gp.zone
wget -P . http://www.ipdeny.com/ipblocks/data/countries/re.zone

# Add each IP address from the downloaded list into the ipset 'china'
for i in $(cat /etc/fr.zone ); do ipset -A france $i; done
for i in $(cat /etc/ca.zone ); do ipset -A canada $i; done
for i in $(cat /etc/be.zone ); do ipset -A belgique $i; done
for i in $(cat /etc/be.zone ); do ipset -A martinique $i; done
for i in $(cat /etc/be.zone ); do ipset -A maurice $i; done
for i in $(cat /etc/be.zone ); do ipset -A guyane $i; done
for i in $(cat /etc/be.zone ); do ipset -A mayotte $i; done
for i in $(cat /etc/be.zone ); do ipset -A maroc $i; done
for i in $(cat /etc/be.zone ); do ipset -A algerie $i; done
for i in $(cat /etc/be.zone ); do ipset -A tunisie $i; done
for i in $(cat /etc/be.zone ); do ipset -A luxembourg $i; done
for i in $(cat /etc/be.zone ); do ipset -A caledonie $i; done
for i in $(cat /etc/be.zone ); do ipset -A suisse $i; done
for i in $(cat /etc/be.zone ); do ipset -A guadeloupe $i; done
for i in $(cat /etc/be.zone ); do ipset -A reunion $i; done

iptables -A INPUT -m set --match-set belgique src -j ACCEPT
iptables -A OUTPUT -m set --match-set belgique src -j ACCEPT
iptables -A INPUT -m set --match-set france src -j ACCEPT
iptables -A OUTPUT -m set --match-set france src -j ACCEPT
iptables -A INPUT -m set --match-set canada src -j ACCEPT
iptables -A OUTPUT -m set --match-set canada src -j ACCEPT
iptables -A INPUT -m set --match-set martinique src -j ACCEPT
iptables -A OUTPUT -m set --match-set martinique src -j ACCEPT
iptables -A INPUT -m set --match-set maurice src -j ACCEPT
iptables -A OUTPUT -m set --match-set maurice src -j ACCEPT
iptables -A INPUT -m set --match-set guyane src -j ACCEPT
iptables -A OUTPUT -m set --match-set guyane src -j ACCEPT
iptables -A INPUT -m set --match-set mayotte src -j ACCEPT
iptables -A OUTPUT -m set --match-set mayotte src -j ACCEPT
iptables -A INPUT -m set --match-set maroc src -j ACCEPT
iptables -A OUTPUT -m set --match-set maroc src -j ACCEPT
iptables -A INPUT -m set --match-set algerie src -j ACCEPT
iptables -A OUTPUT -m set --match-set algerie src -j ACCEPT
iptables -A INPUT -m set --match-set tunisie src -j ACCEPT
iptables -A OUTPUT -m set --match-set tunisie src -j ACCEPT
iptables -A INPUT -m set --match-set luxembourg src -j ACCEPT
iptables -A OUTPUT -m set --match-set luxembourg src -j ACCEPT
iptables -A INPUT -m set --match-set caledonie src -j ACCEPT
iptables -A OUTPUT -m set --match-set caledonie src -j ACCEPT
iptables -A INPUT -m set --match-set suisse src -j ACCEPT
iptables -A OUTPUT -m set --match-set suisse src -j ACCEPT
iptables -A INPUT -m set --match-set guadeloupe src -j ACCEPT
iptables -A OUTPUT -m set --match-set guadeloupe src -j ACCEPT
iptables -A INPUT -m set --match-set reunion src -j ACCEPT
iptables -A OUTPUT -m set --match-set reunion src -j ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
