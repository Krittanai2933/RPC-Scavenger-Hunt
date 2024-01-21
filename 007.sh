# Only one single output remains unspent from block 123,321. What address was it sent to?
hash123321=$(bitcoin-cli getblockhash "123321")
blockdata=$(bitcoin-cli getblock $hash123321)
siginputtx=$(echo $blockdata | jq -r '.tx[6]')
answer=$(bitcoin-cli getrawtransaction "$siginputtx" 1)
echo $answer | jq -r '.vout[0].scriptPubKey.address'
