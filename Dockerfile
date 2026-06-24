# x86_64 (AMD64) ပလက်ဖောင်းကို အသေသတ်မှတ်ပြီး Python ဆွဲယူမည်
FROM --platform=linux/amd64 python:3.10-slim

# ddddocr နှင့် opencv အတွက် မရှိမဖြစ်လိုအပ်သော Linux System Libraries များ သွင်းခြင်း
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Requirements သွင်းခြင်း
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Project ဖိုင်အားလုံးကို ကူးယူခြင်း
COPY . .

# Bot ရဲ့ port ကို standard environment အတိုင်း သတ်မှတ်ခြင်း
EXPOSE 8080

# Bot စတင်ပတ်မည့် Command
CMD ["python", "bot.py"]
