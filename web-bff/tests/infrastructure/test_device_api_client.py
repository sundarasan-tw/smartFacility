import pytest
import respx
import httpx
from app.domain.models.device_model import DeviceDTO
from app.infrastructure.device_api_client import DeviceAPIClient

DEVICE_SERVICE_URL = "https://external-backend.com/api/users"

@pytest.mark.asyncio
@respx.mock
async def test_get_devices():
    mock_response = [
        {"id": 1, "name": "Device A", "status": "active"},
        {"id": 2, "name": "Device B", "status": "inactive"}
    ]
    
    respx.get(f"{DEVICE_SERVICE_URL}/").mock(return_value=httpx.Response(200, json=mock_response))
    
    client = DeviceAPIClient()
    devices = await client.get_devices()
    
    assert len(devices) == 2
    assert devices[0].id == 1
    assert devices[0].name == "Device A"
    assert devices[0].status == "active"
    assert devices[1].id == 2
    assert devices[1].name == "Device B"
    assert devices[1].status == "inactive"

@pytest.mark.asyncio
@respx.mock
async def test_get_device():
    mock_response = {"id": 1, "name": "Device A", "status": "active"}
    
    respx.get(f"{DEVICE_SERVICE_URL}/1").mock(return_value=httpx.Response(200, json=mock_response))
    
    client = DeviceAPIClient()
    device = await client.get_device(1)
    
    assert device.id == 1
    assert device.name == "Device A"
    assert device.status == "active"

