from fastapi import FastAPI

from app.dependencies import get_device_api_client, get_device_service
from app.domain.client_interfaces.device_client import IDeviceAPIClient
from app.domain.service_interfaces.device_service import IDeviceService
from app.presentation.device_routes import device_router

app = FastAPI(title="Smarty Web BFF Service")

# Dependency injection setup
app.dependency_overrides[IDeviceAPIClient] = get_device_api_client
app.dependency_overrides[IDeviceService] = get_device_service


app.include_router(device_router, prefix="/api")

if __name__ == "__main__":
    import uvicorn

    uvicorn.run("app.main:app", reload=True)
