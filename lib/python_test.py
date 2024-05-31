# import http.client

# conn = http.client.HTTPConnection("127.0.0.1", 8000)

# headersList = {
#  "Content-Type": "application/x-www-form-urlencoded" 
# }

# payload = "username=mohammad&question=what is my name &chat_id=1"

# conn.request("POST", "/api/addt", payload, headersList)
# response = conn.getresponse()
# result = response.read()
# r1=[]
# r=result.decode("utf-8")

# print(list(r))
