import pytest
from core.solana.rpc_client import SolanaClient
from unittest.mock import patch

class TestSolanaIntegration:
    @patch('solana.rpc.api.Client')
    def test_fetch_bytecode(self, mock_client):
        """Test real Solana RPC interaction (mocked)"""
        mock_client.return_value.get_account_info.return_value = {
            'result': {'value': {'data': ['mock_bytecode_here', 'base64']}
        }
        
        client = SolanaClient("https://api.testnet.solana.com")
        bytecode = client.fetch_bytecode("FakeAddress11111111111111111111111111111111111")
        assert isinstance(bytecode, bytes)
