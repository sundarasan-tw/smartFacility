from fastapi import APIRouter

health_router = APIRouter()


@health_router.get("/health", response_model=dict)
async def health_check():
    return {"status": "ok"}
