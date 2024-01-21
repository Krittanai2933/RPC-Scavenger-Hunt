# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
rawtx=$(bitcoin-cli getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163 1)
npubencodeed=$(echo $rawtx | jq -r '.vin[0].txinwitness[2]')
decode=$(bitcoin-cli decodescript $npubencodeed)
echo $decode | jq -r '.asm' | cut -d ' ' -f2
