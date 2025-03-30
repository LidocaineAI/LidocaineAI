# LidocaineAI API Reference

## Threat Analysis Endpoint
```http
POST /api/v1/scan
```

**Request:**
```json
{
  "bytecode": "0x6060...",
  "chain": "solana|ethereum"
}
```

**Response:**
```json
{
  "risk_score": 85,
  "threats": ["RUG_PULL", "HONEYPOT"],
  "confidence": 0.92
}
```

## Token Verification
```http
GET /api/v1/verify/{contract_address}
```

**Response:**
```json
{
  "verified": false,
  "last_scan": "2024-03-15T12:00:00Z",
  "report_url": "https://lidocaine.ai/reports/0x123..."
}
```

## WebSocket Feed
```
wss://api.lidocaine.ai/v1/alerts
```
- Streams real-time threat detections
- Sample payload:
```json
{
  "event": "NEW_THREAT",
  "contract": "0x123...",
  "threat_type": "OWNER_CHANGE"
}
```
