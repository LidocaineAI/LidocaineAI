import requests
import json

class SolanaClient:
    def __init__(self, endpoint='https://api.mainnet-beta.solana.com'):
        self.endpoint = endpoint

    def get_bytecode(self, contract_address: str) -> str:
        """Fetch bytecode from Solana RPC"""
        payload = {
            "jsonrpc": "2.0",
            "id": 1,
            "method": "getAccountInfo",
            "params": [
                contract_address,
                {"encoding": "base58"}
            ]
        }
        try:
            response = requests.post(self.endpoint, json=payload).json()
            return response['result']['value']['data'][0]
        except:
            return ""
