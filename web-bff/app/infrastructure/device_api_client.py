import httpx

from app.domain.models.device_model import DeviceDTO

DEVICE_SERVICE_URL = "https://external-backend.com/api/users"


class DeviceAPIClient:
    async def get_devices(self) -> list[DeviceDTO]:
        async with httpx.AsyncClient() as client:
            response = await client.get(f"{DEVICE_SERVICE_URL}/")
            return [DeviceDTO(**device) for device in response.json()]

    async def get_device(self, device_id: int) -> DeviceDTO:
        async with httpx.AsyncClient() as client:
            response = await client.get(f"{DEVICE_SERVICE_URL}/{device_id}")
            return DeviceDTO(**response.json())
