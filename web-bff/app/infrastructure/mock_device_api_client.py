from app.domain.client_interfaces.device_client import IDeviceAPIClient
from app.domain.models.device_model import DeviceDTO

MOCK_DEVICES = [
    DeviceDTO(id=1, name="Sensor A", status="online"),
    DeviceDTO(id=2, name="Camera B", status="offline"),
    DeviceDTO(id=3, name="Thermostat C", status="online"),
]


class MockDeviceAPIClient(IDeviceAPIClient):
    async def get_devices(self) -> list[DeviceDTO]:
        """Returns mock device data"""
        return MOCK_DEVICES

    async def get_device(self, device_id: int) -> DeviceDTO:
        """Returns a single mock device"""
        for device in MOCK_DEVICES:
            if device.id == device_id:
                return device
        return None  # Or raise an exception if needed
