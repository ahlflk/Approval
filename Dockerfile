FROM python:3.12-slim

# လိုအပ်တဲ့ Linux packages များ သွင်းခြင်း
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Render Port
ENV PORT=8080

CMD ["python", "bot.py"]
