# LidocaineAI Architecture

## Core Components
```mermaid
graph TD
    A[User] -->|Bytecode| B(Threat Analyzer)
    B --> C{LSTM Model}
    B --> D[Pattern DB]
    C --> E[Risk Score]
    D --> E
    E --> F[Blockchain Nodes]
```

## Data Flow
1. **Input**:
   - Raw contract bytecode
   - On-chain transaction history

2. **Processing**:
   ```python
   def analyze(bytecode):
       patterns = yara.match(bytecode)
       ml_score = model.predict(bytecode)
       return combine_scores(patterns, ml_score)
   ```

3. **Output**:
   - Risk score (0-100)
   - Threat classification

## Dependencies
- Solana/ETH RPC nodes
- TensorFlow Serving
- Redis (alert caching)
