import pytest
import pytest_asyncio
from unittest.mock import AsyncMock
from fastapi.testclient import TestClient
from app.main import app  # Ensure this imports your FastAPI app instance
from app.application.device_service import DeviceService
from app.domain.models.device_model import DeviceDTO

@pytest.fixture
def mock_device_service():
    service = AsyncMock(spec=DeviceService)
    
    # Use AsyncMock for async methods
    service.get_devices = AsyncMock(return_value=[
        {"id": 1, "name": "Device 1", "status": "active"},
        {"id": 2, "name": "Device 2", "status": "inactive"},
    ])
    service.get_device = AsyncMock(return_value={"id": 1, "name": "Device 1", "status": "active"})
    
    return service

@pytest_asyncio.fixture
async def async_client(mock_device_service):
    app.dependency_overrides[DeviceService] = lambda: mock_device_service
    client = TestClient(app)
    yield client

@pytest.mark.asyncio
def test_get_devices(async_client):
    response =  async_client.get("api/devices")
    assert response.status_code == 200
    assert response.json() == [
        {"id": 1, "name": "Device 1", "status": "active"},
        {"id": 2, "name": "Device 2", "status": "inactive"},
    ]

@pytest.mark.asyncio
def test_get_device(async_client):
    response =  async_client.get("api/devices/1")
    assert response.status_code == 200
    assert response.json() == {"id": 1, "name": "Device 1", "status": "active"}
