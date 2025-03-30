from core.solana.rpc_client import SolanaClient
from core import ThreatAnalyzer

client = SolanaClient("https://api.mainnet-beta.solana.com")
analyzer = ThreatAnalyzer()

# Fetch and scan real contract
address = "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
bytecode = client.fetch_bytecode(address)
result = analyzer.scan(bytecode)

print(f"Contract {address} risk: {result['score']}/100")
