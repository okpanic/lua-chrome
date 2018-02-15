local _chrome = {}

_chrome.bin = "/usr/lib64/chromium-browser/chromium-browser"
_chrome.options = { proxy = false }

function _chrome:new(c)
   c = c or {}
   setmetatable(c, self)
   self.__index = self
   return c
end

function _chrome:dump(_url)
   self.url = _url or self.url
   self.options.proxy = self.options.proxy or " "
   self.cmd = self.bin .. " --headless --disable-gpu " .. self.options.proxy .. " --dump-dom " .. self.url 
   self.dom = io.popen(self.cmd):read("*a") or ""
   if self.dom == "<body></body>\n" or self.dom == "" 
   then 
      self.dom = nil
   end
end

function _chrome:screenshot(_url)
   self.url = _url or self.url
   self.options.proxy = self.options.proxy or " "
   self.cmd = self.bin .. " --headless --disable-gpu " .. self.options.proxy .. " --screenshot " .. self.url
   self.screenshot = io.popen(self.cmd):read("*a") or ""
   if self.dom == "<body></body>\n" or self.dom == "" 
   then 
      self.dom = nil
   end
end

function _chrome:help()
print([[
USAGE
chrome = require'chrome':new()

DESCRIPTION
showing defaults
--set path to chromium browser executable
chrome.bin = "/usr/lib64/chromium-browser/chromium-browser" 

--pass proxy options as a string, or pass false 
chrome.proxy = false

FUNCTIONS
--Dump DOM HTML
--Returns nil, stores dom in chrome object under chrome.dom
--Pass url as string, will default to chrome.url field, if it exists
chrome:dump(url) 

--pass url as string, will default to chrome.url field, if it exists
chrome:dump(url)
]])
end

local chrome = _chrome:new()

return chrome
