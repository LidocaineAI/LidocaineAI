from core.models import load_model
import numpy as np

def test_model_loading():
    """Verify model loads with correct input shape"""
    model = load_model("detector.h5")
    dummy_input = np.zeros((1, 100, 4))  # (batches, sequence_len, features)
    prediction = model.predict(dummy_input)
    assert prediction.shape == (1, 1)  # Single risk score output
