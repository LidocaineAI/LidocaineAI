import pytest
from core import ThreatAnalyzer

class TestThreatAnalyzer:
    @pytest.fixture
    def analyzer(self):
        return ThreatAnalyzer()

    def test_risk_calculation(self, analyzer):
        """Test risk scoring with mock bytecode"""
        safe_bytecode = b"\x00\x71\x02"  # Real bytecode truncated for example
        assert 0 <= analyzer.scan(safe_bytecode) <= 100

    def test_empty_bytecode(self, analyzer):
        """Edge case: empty input"""
        with pytest.raises(ValueError):
            analyzer.scan(b"")
