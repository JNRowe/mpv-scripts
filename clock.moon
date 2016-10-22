mp.add_key_binding "`", "clock-display", ->
    mp.osd_message os.date("%FT%T")
