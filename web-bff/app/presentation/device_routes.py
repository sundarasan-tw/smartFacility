from fastapi import APIRouter, Depends

from app.application.device_service import DeviceService
from app.domain.models.device_model import DeviceDTO

device_router = APIRouter()


@device_router.get("/devices", response_model=list[DeviceDTO])
async def get_devices(service: DeviceService = Depends()):
    return await service.get_devices()


@device_router.get("/devices/{device_id}", response_model=DeviceDTO)
async def get_device(device_id: int, service: DeviceService = Depends()):
    return await service.get_device(device_id)
