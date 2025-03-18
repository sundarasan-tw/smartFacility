from fastapi import Depends

from app.application.device_service import DeviceService
from app.domain.client_interfaces.device_client import IDeviceAPIClient
from app.infrastructure.mock_device_api_client import MockDeviceAPIClient


# Dependency for IDeviceAPIClient
def get_device_api_client() -> IDeviceAPIClient:
    return MockDeviceAPIClient()


# Dependency for DeviceService
def get_device_service(
    api_client: IDeviceAPIClient = Depends(get_device_api_client),
) -> DeviceService:
    return DeviceService(api_client=api_client)
