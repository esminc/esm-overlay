esm-overlay
===========

ESM's portage overlay. It's useful for especially Ruby/Rails application development. For example:

* dev-ruby/rbenv
* dev-ruby/ruby-build
* app-shells/z
* app-admin/fluentd

## Installation

1\. Install `app-portage/layman`.

```
# echo 'app-portage/layman git' >> /etc/portage/package.use
# emerge -av layman
```

2\. Add this overlay.

```
# curl https://raw.githubusercontent.com/esminc/esm-overlay/master/profiles/layman.xml > /etc/layman/overlays/esm-overlay.xml
# layman -f -a esm
```

3\. Edit your `make.conf`.

```
# echo 'source /var/lib/layman/make.conf' >> /etc/portage/make.conf
```

4\. Enjoy!
