from abc import ABC, abstractmethod

from app.domain.models.device_model import DeviceDTO


class IDeviceService(ABC):
    @abstractmethod
    async def get_devices(self) -> list[DeviceDTO]:
        pass

    @abstractmethod
    async def get_device(self, device_id: int) -> DeviceDTO:
        pass
