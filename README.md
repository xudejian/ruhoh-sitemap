ruhoh-sitemap
=============

ruhoh sitemap generator

### How to use?

chdir to your ruhoh blog repository path

`git submodule add git://github.com/xudejian/ruhoh-sitemap.git plugins/sitemap`

or download files and put it to `your-blog-path/plugins/sitemap`

then compile your blog, your will get sitemap.xml on `your-blog-path/compiled/`

### How to config?

1. site globel settings like

    in config.yml

    ```
    plugins:
      sitemap:
        file_name: sitemap.xml #(optional, valid only here)
        changefreq: daily
        priority: 0.7
    ```

2. collections settings like

    in config.yml

    ```
    _root: # or posts:
      sitemap:
        changefreq: hourly
        priority: 0.9
    ```

3. page settings like

    in _root/index.html

    ```
    ---
    priority: 1.0
    ---
    ```

#### Tips

All sitemap config is optional

default config

```
file_name: sitemap.xml
changefreq: daily
priority: 0.7
```


### Author

Dejian Xu
[G+](https://plus.google.com/116305544434538996428?rel=author)

