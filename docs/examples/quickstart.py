from core import ThreatAnalyzer

# Initialize
analyzer = ThreatAnalyzer(model_path="models/detector.h5")

# Scan bytecode (mock example)
result = analyzer.scan(
    bytecode=b"\x60\x60\x40\x52",  # Real bytecode truncated
    chain="solana"
)

print(f"Risk score: {result['score']}")
print(f"Threats detected: {result['threats']}")
