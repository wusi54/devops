from fastapi import FastAPI
from fastapi.responses import RedirectResponse
import uvicorn
import re

app=FastAPI()


@app.post('/newurl',name='q2_1 request for submission')
async def func1(url:str):
    return {"url":url,"shortenUrl":"https://shortenurl.org/g20hi3k9"}

@app.get('/{args}',name='q2_2 Shorten redirect url')
async def func2(args:str):
    if re.match(r"[a-zA-Z0-9]{9}",args):
        return RedirectResponse(
            status_code=304,
            url="https://www.google.com"
        )
    else:
        print(222222222222)
if __name__ =='__main__':
    uvicorn.run(app=app,host='0.0.0.0',debug=True)