# Which tx in block 257,343 spends the coinbase output of block 256,128?
hash_256128=$(bitcoin-cli getblockhash 256128)
hash_257343=$(bitcoin-cli getblockhash 257343)
block_data_256128=$(bitcoin-cli getblock $hash_256128)
block_data_257343=$(bitcoin-cli getblock $hash_257343)
coinbase256128=$(echo $block_data_256128 | jq -r '.tx[0]')
tx1=$(echo $block_data_257343 | jq -r '.tx[0]')
tx2=$(echo $block_data_257343 | jq -r '.tx[1]')
tx3=$(echo $block_data_257343 | jq -r '.tx[2]')
#find result
bitcoin-cli getrawtransaction "$tx1" 1 | grep $coinbase256128
bitcoin-cli getrawtransaction "$tx2" 1 | grep $coinbase256128
# result in tx3
#bitcoin-cli getrawtransaction "$tx3" 1 | grep $coinbase256128 
echo "$tx3"
