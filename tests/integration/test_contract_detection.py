from brownie import accounts, MockMaliciousToken
from core import ThreatAnalyzer

def test_honeypot_detection():
    """Integration with Solidity mocks"""
    analyzer = ThreatAnalyzer()
    malicious_token = MockMaliciousToken.deploy({'from': accounts[0]})
    
    result = analyzer.scan(malicious_token.bytecode)
    assert result['risk'] > 80  # Should flag high risk
    assert "Transfer blocked" in result['patterns']  # Detect malicious function
