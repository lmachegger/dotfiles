-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- m4chei: Start solaar for fixing logitech mouse scroll wheel issues.
-- It is necessary to disable the high precision scroll wheel.
o.launch_on_start("solaar --window=hide")
