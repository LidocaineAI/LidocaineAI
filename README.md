# <img src="assets/logo.png" width="40"> Lidocaine AI - Solana Smart Contract Auditor
![License](https://img.shields.io/badge/License-MIT-blue.svg) ![Python](https://img.shields.io/badge/Python-3.10+-blue.svg) ![Solana](https://img.shields.io/badge/Solana-3E1E90?logo=solana)
> AI-powered security scanner detecting rug pulls, honeypots, and malicious contracts
## ✨ Features
- 🚀 **500ms scans** using optimized TensorFlow models
- 🔍 **Multi-layer analysis** (bytecode, behavior, social)
- 🛡️ **Wallet integration** (Phantom/Backpack)
- 📊 **Community-driven** threat database
## 🚀 Quick Start
### Prerequisites
- Python 3.10+
- Node.js 18.x (for extension)
- [Solana CLI](https://docs.solana.com/cli/install-solana-cli-tools)
### Installation
```bash
git clone https://github.com/LidocaineAI/lidocaineai.git
cd lidocaineai
pip install -r requirements.txt
```
### Basic Usage
```python
from lidocaineai import Scanner
scanner = Scanner()
result = scanner.analyze("7xK...V1q")
print(f"Pain Score: {result['pain_score']}/100")
print(f"Risks: {
.join(result['risks'])}")
```
## 📂 Project Structure
```
lidocaineai/
├── .github/
│   └── workflows/
│       ├── audit.yml
│       └── test.yml
├── contracts/
│   ├── interfaces/
│   │   ├── IScanner.sol
│   │   └── IToken.sol
│   ├── mocks/
│   │   ├── MockMaliciousToken.sol
│   │   ├── MockSafeToken.sol
│   │   ├── MockScanner.sol
│       └── MockRugPull.sol
│   ├── LIDO.sol
│   └── Scanner.sol
├── core/
│   ├── __init__.py
│   ├── scanner.py
│   ├── models/
│   │   └── detector.h5
│   └── solana/
│       └── rpc_client.py
├── docs/
│   ├── API.md
│   ├── ARCHITECTURE.md
│   ├── THREATS.md
│   ├── WHITEPAPER.md
│   └── examples/
│       ├── quickstart.py
│       └── solana_scan.py
├── extension/
│   ├── background.js
│   ├── content.js
│   └── manifest.json
├── scripts/
│   └── deploy.py
├── tests/
│   ├── unit/
│   │   ├── __init__.py
│   │   ├── test_scanner.py
│   │   └── test_models.py
│   └── integration/
│       ├── __init__.py
│       ├── test_solana_integration.py
│       └── test_contract_detection.py
├── .env.sample
├── .gitignore
├── LICENSE
├── Makefile
└── pyproject.toml

```
## 🛠️ Development
```bash
pytest tests/ -v
cd extension
npm install
npm run build
```
## 🤝 Contributing
We welcome:
- New scam patterns ([THREATS.md](docs/THREATS.md))
- Model improvements
- Wallet integrations
**Earn $LIDO** for verified contributions!
## 📜 License
MIT - See [LICENSE](LICENSE) for details.
---
<p align="center">
<img src="assets/logo-banner.png" width="600">
</p>
