from sqlalchemy.orm import sessionmaker, declarative_base
from sqlalchemy import create_engine

# DATABASE_URL = "postgresql://postgres:Hariom@db:5432/postgres"
#DATABASE_URL = "postgresql://Bit:Hariom@db:5432/bitdb"
DATABASE_URL = "postgresql://postgres:Hariom@bit:5432/bitdb"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
