# How many new outputs were created by block 123,456?
outs=$(bitcoin-cli getblockstats 123456 '["outs"]')
echo $outs | jq .outs
