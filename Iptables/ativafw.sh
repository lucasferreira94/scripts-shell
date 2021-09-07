#!/usr/bin/env bash

# ===================== CONFIGURAÇÕES GERAIS =================== #

# Limpa todas as regras das 3 tabelas principais
iptables -F -t nat
iptables -F -t filter
iptables -F -t mangle

# Altera para o padrão as chains da tabela Filter para rejeitar pcts
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Permite fluxo de tráfego na interface loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


# ================== REDE LOCAL <-> INTERNET =================== #


# ================== FIREWALL <-> INTERNET ===================== #

# Permite a saída de Ping do Firewall para Internet
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

# Permite a Saída de consulta DNS do Firewall para Internet
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

# Permite a Saída para Web
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --sport 443 -j ACCEPT
iptables -A INPUT -p tcp --sport 80 -j ACCEPT
# =================== FIREWALL <-> REDE LOCAL =================== #


