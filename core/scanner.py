import tensorflow as tf
import numpy as np
from solana.rpc_client import SolanaClient

class LidocaineScanner:
    def __init__(self, model_path='models/detector.h5'):
        self.model = tf.keras.models.load_model(model_path)
        self.rpc = SolanaClient()
        self.threat_db = self._load_threat_patterns()

    def _extract_features(self, bytecode: str) -> np.array:
        """Convert Solana bytecode to ML features"""
        return np.array([
            len(bytecode),
            bytecode.count('6a'),  # Common scam opcodes
            bytecode.count('52')
        ]).reshape(1, -1)

    def analyze(self, contract_address: str) -> dict:
        """Main analysis pipeline"""
        bytecode = self.rpc.get_bytecode(contract_address)
        if not bytecode:
            return {'error': 'Invalid contract address'}

        features = self._extract_features(bytecode)
        risk_score = min(100, self.model.predict(features)[0][0] * 100)
        
        return {
            'contract': contract_address,
            'pain_score': round(risk_score, 1),
            'risks': self._flag_risks(bytecode),
            'timestamp': int(time.time())
        }

    def _flag_risks(self, bytecode: str) -> list:
        """Check against known threat patterns"""
        return [
            pattern for pattern in self.threat_db 
            if pattern in bytecode
        ][:5]  # Return top 5 risks
