Silly mpv scripts
=================

mpv_ is fantastic, but it could be ever so marginally better… this is an attempt
to make it so.  You'll find here various totally quick and dirty scripts that
enhance my ``mpv`` experience, perhaps they'll do some thing for you too!

The scripts are released under the GPL v2 or later, to follow the example set in
the upstream project.

Included scripts
----------------

.. note::
   See the scripts for further information, including usage.

clock
'''''

*No, really*.  Having a popup clock is super useful, it saves having to dip in
and out of fullscreen mode all the time.

It is bound ``backtick`` by default, simply because that matches my ``Mod4``
binding in awesomewm_ to toggle the wibox.

rating
''''''

A super simplistic rating system for files.  Hit ``<C-{1..5}>`` to toggle
a symlink in ``$XDG_DATA_HOME/mpv/ratings``.  Then you can play files with
a specific rating by ``glob``'ing at the symlink directories.

Bugs
----

If you find any problems, bugs or just have a question about this package either
file an issue_ or drop me a mail_.

If you've found a bug please attempt to include a minimal testcase so I can
reproduce the problem, or even better a patch!


.. _mpv: https://mpv.io/
.. _awesomewm: http://awesome.naquadah.org/
.. _issue: https://github.com/JNRowe/mpv-scripts/issues
.. _mail: jnrowe@gmail.com
