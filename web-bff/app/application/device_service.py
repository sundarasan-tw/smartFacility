from fastapi import Depends

from app.domain.client_interfaces.device_client import IDeviceAPIClient
from app.domain.models.device_model import DeviceDTO
from app.domain.service_interfaces.device_service import IDeviceService


class DeviceService(IDeviceService):
    def __init__(self, api_client: IDeviceAPIClient = Depends()):
        self.api_client = api_client

    async def get_devices(self) -> list[DeviceDTO]:
        devices = await self.api_client.get_devices()
        return devices

    async def get_device(self, user_id: int) -> DeviceDTO:
        return await self.api_client.get_device(user_id)
