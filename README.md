Introduction
============

Plugin to display your [Gravatar hovercard](http://en.support.wordpress.com/gravatar-hovercards/)
in the sidebar of your Octopress site. The "hovering" portion of the hovercard is not currently implemented.

Make sure you have filled out your [Gravatar profile](http://en.gravatar.com/profiles/edit/#about-you) for
information to show up in the cool card.

Every time you change your profile, you will have to regenerate your blog to update the hovercard. This may
change in future development.

Live example at http://blog.afontaine.ca


Installation:
-------------

1. Copy `gravatar.html` to your `_includes/custom/asides` directory.
2. Copy `gravatar.rb` to your `plugins` directory.
3. Update your `_config.yml` file to include a `gravatar_email` variable.
Example below which is also in the provided `_config.yml` file:

```yml
# Gravatar
gravatar_email: youraddress@example.com
```

4. Add `gravatar.html` to your `default_asides` variable in the `_config.yml`
settings file. Example:

```yml
default_asides: [custom/asides/gravatar.html, custom/asides/about.html, ...]
```

Screenshots:
------------
![afontaine](http://i.imgur.com/EXwfQgo.png)
