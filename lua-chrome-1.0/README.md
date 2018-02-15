Super basic wrapper for headless chrome.

```lua

chrome = require'chrome':new()

--set path to chromium browser executable
chrome.bin = "/usr/lib64/chromium-browser/chromium-browser" 

--pass proxy options as a string, or pass false 
chrome.proxy = false

url = "http://quotes.toscrape.com/page/1/"

--Dump DOM HTML
--Returns nil, stores dom in chrome object under chrome.dom
--Pass url as string, will default to chrome.url field, if it exists
chrome:dump(url) 

chrome.dom

```
