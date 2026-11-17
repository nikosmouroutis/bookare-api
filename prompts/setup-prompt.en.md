# Bookare setup prompt (English)

Paste this into ChatGPT, Claude, Gemini or any chat assistant. It interviews you and either sets up your venue with Bookare's tools, or gives you a BOOKARE SETUP block to paste at https://bookare.app/start.

```text
You are helping me set up online booking for my business with Bookare (bookare.app).
Interview me one question at a time, in my language, with short questions and examples. Find out:
1. What kind of business it is, its name, town and country.
2. Opening days and hours, and any breaks during the day.
3. What my customers book: classes on a weekly timetable, appointments for services, tables, or rooms and pitches by the night.
4. The details. Classes: names, days, times, length, places per class and instructor. Appointments: each service with its length, price and who does it. Tables: how many and how many seats. Stays: each kind of room or pitch, how many, guests, price per night, seasons, and the months it is open if not all year.
5. What customers pay: packs or memberships, with number of classes, how long they last and the price.
6. My rules: how many days ahead people can book, and until when they can cancel for free.
7. My name and email, and the business phone, address (street, postal code, town) and website or Instagram.
If I don’t know something, suggest what is usual for a business like mine and let me say yes or change it. Skip anything that doesn’t apply to my business.
When you have everything, show me a short summary and ask me to confirm.
Then: if you can use Bookare’s tools (bookare.app/mcp), set up my venue and give me the link to confirm it. If you can’t, reply with one code block in exactly this format, leaving out what doesn’t apply, and tell me to paste it at bookare.app/start.
For the block: a break in the day is two booking_hours rows; season dates are the next real dates (YYYY-MM-DD); open_season is month-day; website can be an Instagram link; leave out anything I did not give and you did not suggest.

BOOKARE SETUP
{
  "type": "gym | salon | restaurant | hotel | camping | rental",
  "name": "", "city": "", "street": "", "postal_code": "", "country": "GR", "language": "el",
  "phone": "", "email": "", "website": "",
  "owner": { "name": "", "email": "" },
  "opening_hours": ["Mon–Fri 09:00–21:00", "Sat 09:00–14:00"],
  "classes": [{ "name": "Pilates", "spots": 8, "times": [{ "days": ["mon", "wed"], "time": "18:00", "minutes": 60, "instructor": "Maria" }] }],
  "packs": [{ "name": "8 classes", "classes": 8, "unlimited": false, "valid_days": 35, "price": 90 }],
  "booking_rules": { "days_ahead": 14, "cancel_hours_before": 12 },
  "services": [{ "name": "Haircut", "minutes": 45, "price": 25, "staff": ["Maria"] }],
  "staff": ["Maria"],
  "booking_hours": [{ "days": ["mon", "tue", "wed", "thu", "fri"], "from": "10:00", "to": "20:00" }],
  "tables": [{ "name": "Table", "seats": 4, "count": 6 }],
  "units": [{ "name": "Double room", "kind": "room | apartment | home | caravan | glamping | pitch", "count": 4, "guests": 2, "price_per_night": 80, "min_nights": 1, "description": "" }],
  "seasons": [{ "name": "August", "from": "2027-08-01", "to": "2027-08-31", "price_per_night": 120, "unit": "Double room" }],
  "stay_rules": { "check_in_from": "15:00", "check_out_by": "11:00", "cancel_days_before": 7 },
  "open_season": { "from": "05-15", "to": "09-30" },
  "about": ""
}
```
