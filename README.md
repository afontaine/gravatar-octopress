Introduction
============

Plugin to display your Gravatar avatar in the sidebar of your Octopress site.

Live example at http://www.joet3ch.com and http://www.rayfaddis.com


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

4. Add `gravatar.html` to your default_asides variable in the `_config.yml`
settings file. Example:

```yml
default_asides: [custom/asides/gravatar.html, custom/asides/about.html, ...]
```

Customize Image Size:
---------------------

You can customize the size of the image in the gravatar.html file:

```html
<img src="{% gravatar_image 200 %}" alt="Gravatar of {{ site.author}} " title="Gravatar of {{ site.author }}" />
```
