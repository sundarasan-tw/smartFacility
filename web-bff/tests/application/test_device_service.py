import pytest
from unittest.mock import AsyncMock
from app.domain.service_interfaces.device_service import IDeviceService
from app.domain.models.device_model import DeviceDTO


@pytest.mark.asyncio
async def test_get_devices():
    # Arrange
    mock_service = AsyncMock(spec=IDeviceService)
    mock_service.get_devices.return_value = [
        DeviceDTO(id=1, name="Device 1", status="active"),
        DeviceDTO(id=2, name="Device 2", status="inactive"),
    ]

    # Act
    devices = await mock_service.get_devices()

    # Assert
    assert len(devices) == 2
    assert devices[0].name == "Device 1"
    assert devices[0].status == "active"
    assert devices[1].name == "Device 2"
    assert devices[1].status == "inactive"


@pytest.mark.asyncio
async def test_get_device():
    # Arrange
    mock_service = AsyncMock(spec=IDeviceService)
    mock_service.get_device.return_value = DeviceDTO(id=1, name="Device 1", status="active")

    # Act
    device = await mock_service.get_device(1)

    # Assert
    assert device.id == 1
    assert device.name == "Device 1"
    assert device.status == "active"