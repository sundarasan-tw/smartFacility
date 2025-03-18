from pydantic import BaseModel


class DeviceDTO(BaseModel):
    id: int
    name: str
    status: str
