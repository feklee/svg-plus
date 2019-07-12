(require 'svg+)

(setq svg (svg+-create 400 400))

(svg+-circle svg 200 200 100)

(svg+-insert-image svg)

(with-temp-file "example.svg"
  (set-buffer-multibyte nil)
  (svg+-print svg))
