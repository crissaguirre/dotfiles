#!/usr/bin/python3
import json, subprocess
from datetime import datetime, timedelta

MONTHS = ["Enero","Febrero","Marzo","Abril","Mayo","Junio",
          "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
DAYS   = ["Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo"]

def get_events():
    events = []
    try:
        today = datetime.now()
        end   = today + timedelta(days=1)
        result = subprocess.run(
            ["gcalcli","agenda",
             today.strftime("%Y-%m-%d"),
             end.strftime("%Y-%m-%d"),
             "--nocolor","--tsv"],
            capture_output=True, text=True, timeout=8
        )
        for line in result.stdout.strip().split('\n'):
            parts = line.split('\t')
            if len(parts) < 4: continue
            start_t = parts[1]
            end_t   = parts[2]
            title   = parts[3]
            time_d  = "Todo el día" if start_t == "00:00" else f"{start_t} – {end_t}"
            events.append({"name": title, "time": time_d, "source": "google"})
    except Exception:
        pass
    return events

now = datetime.now()
data = {
    "month":   MONTHS[now.month - 1] + " " + str(now.year),
    "weekday": DAYS[now.weekday()] + " " + str(now.day).zfill(2),
    "events":  get_events()
}
print(json.dumps(data))

