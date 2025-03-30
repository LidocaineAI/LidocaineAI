import os
from brownie import LIDO, Scanner, accounts, config

def main():
    # 1. Deploy contracts
    scanner = Scanner.deploy(
        config["models"]["detector_url"],
        {"from": accounts.load("deployer")}
    )
    
    lido = LIDO.deploy(
        scanner.address,
        {"from": accounts[0]}
    )

    # 2. Verify on Etherscan
    os.system(f"brownie verify {scanner.address} --network mainnet")
    os.system(f"brownie verify {lido.address} {scanner.address} --network mainnet")

    print(f"Scanner deployed at: {scanner.address}")
    print(f"LIDO token deployed at: {lido.address}")
