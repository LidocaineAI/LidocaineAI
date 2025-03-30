"""
LidocaineAI Core Module
"""
from .scanner import ThreatAnalyzer  # Expose main class
from .solana.rpc_client import SolanaClient

__version__ = "0.1.0"
__all__ = ['ThreatAnalyzer', 'SolanaClient']
