-- *No, really*.  Having a popup clock is super useful, it saves having to dip
-- in and out of fullscreen mode all the time.
--
-- It is bound to ``backtick`` by default, simply because that matches my
-- ``Mod4`` binding in awesomewm to toggle the wibox.

mp.add_key_binding "`", "clock-display", ->
    mp.osd_message os.date("%FT%T")
