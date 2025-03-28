from fastapi import APIRouter

from app.application.device_service import DeviceService
from app.domain.models.device_model import DeviceDTO

health_router = APIRouter()

@health_router.get("/health", response_model=dict)
async def health_check():
    return {"status": "ok"}