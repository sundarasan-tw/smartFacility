from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware

from app.dependencies import get_device_api_client, get_device_service
from app.domain.client_interfaces.device_client import IDeviceAPIClient
from app.domain.service_interfaces.device_service import IDeviceService
from app.presentation.device_routes import device_router
from app.presentation.health_routes import health_router
from app.utils.logging_config import logger

app = FastAPI(title="Smarty Web BFF Service")

# Add CORS middleware (optional, for cross-origin requests)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this for production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Dependency injection setup
app.dependency_overrides[IDeviceAPIClient] = get_device_api_client
app.dependency_overrides[IDeviceService] = get_device_service


@app.middleware("http")
async def log_requests(request: Request, call_next):
    logger.info(f"Incoming request: {request.method} {request.url}")
    response = await call_next(request)
    logger.info(f"Response status: {response.status_code}")
    return response


@app.on_event("startup")
async def startup_event():
    logger.info("Starting up the Web BFF app...")


@app.on_event("shutdown")
async def shutdown_event():
    logger.info("Shutting down the Web BFF app...")


app.include_router(device_router, prefix="/api")
app.include_router(health_router)

if __name__ == "__main__":
    import uvicorn

    uvicorn.run("app.main:app", reload=True)
