from apprise.decorators import notify
from datetime import datetime

import json

@notify(on="savetodisk")
def save_to_disk(body, title, notify_type, *args, **kwargs):

    now = datetime.now().astimezone()
    filename = f"/notifications/{now.date()}.log"

    data = {
        "time": now.isoformat(),
        "title": title,
        "body": body
    }

    with open(filename, "a", encoding="utf-8") as f:
        f.write(json.dumps(data, ensure_ascii=False) + "\n")
