import unittest
from unittest.mock import MagicMock
from core.scanner import LidocaineScanner

class TestScanner(unittest.TestCase):
    def setUp(self):
        self.scanner = LidocaineScanner()
        self.scanner.rpc = MagicMock()
        self.scanner.rpc.get_bytecode.return_value = "test_bytecode"

    def test_analysis(self):
        result = self.scanner.analyze('fake_address')
        self.assertIn('pain_score', result)
        self.assertTrue(0 <= result['pain_score'] <= 100)

    def test_empty_bytecode(self):
        self.scanner.rpc.get_bytecode.return_value = ""
        result = self.scanner.analyze('invalid_address')
        self.assertIn('error', result)

if __name__ == '__main__':
    unittest.main()
