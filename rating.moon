-- Rate files in an ultimately quite weak way
--
-- Say you're watching episodes of Siblings and that "Dad's new fiancé" episode
-- pops up, just tap C-5 and a link is made in ${XDG_DATA_HOME}/mpv/ratings/5.
-- Then at some later point, after you've been forced to suffer through an
-- entire thirteen seconds of How I Met Your Mother, you can attempt to redeem
-- some essence of sanity with `mpv ${XDG_DATA_HOME}/mpv/ratings/5/**(@-.Oa)` to
-- pull the furthest seen classic from the pile by taking advantage of zsh's
-- fancy glob'ing support.
--
-- Note: You'll have to manually clean up bad links should you delete the media
-- files themselves, something like the following zsh example should do the
-- trick: rm ${XDG_DATA_HOME}/mpv/ratings/**(-@)

lgi = require "lgi"
Gio = lgi.Gio
GLib = lgi.GLib

rating_dir = "#{GLib.get_user_data_dir!}/mpv/ratings"
-- If your font doesn't support CIRCLED WHITE STAR, change this to '*'
rating_char = '✪'

toggle_rating = (key) ->
    path = mp.get_property "path"
    unless GLib.path_is_absolute path
        path = "#{mp.get_property 'working-directory'}/#{path}"
    path = path\gsub "^#{rating_dir}/%d", ""
    -- Alternatives to full path ratings could be:
    --
    -- * `GLib.uri_escape_string path` or
    -- * `GLib.compute_checksum_for_string GLib.ChecksumType.SHA1, path, -1`.
    --
    -- The first can be *really* long(maybe beyond PATH_MAX), the second hides
    -- itself a little too much for my liking.
    link_name = "#{rating_dir}/#{key}/#{path}"
    GLib.mkdir_with_parents GLib.path_get_dirname(link_name), 493  -- 0755
    with Gio.file_new_for_path link_name
        action = if \query_exists!
            \delete!
            "Removed"
        else
            \make_symbolic_link path
            "Added"
        mp.osd_message "#{action} #{rating_char\rep key} rating"

for key = 1, 5
    mp.add_key_binding "ctrl+#{key}", "rate-#{key}", -> toggle_rating key
