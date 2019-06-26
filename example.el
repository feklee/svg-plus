(setq svg (svg+-create 800 800 :stroke "orange" :stroke-width 5))
(svg+-gradient svg "gradient" 'linear '((0 . "red") (100 . "blue")))

(svg+-image svg)
(svg+-insert-image svg) 

;; For interactive updates, if Emacs can display SVG:
(save-excursion (goto-char (point-max)) (svg+-insert-image svg))


(let ((clip-path (svg+-clip-path svg :id "foo")))
  (svg+-circle clip-path 350 350 300 :stroke-width 0))
(svg+-rectangle svg 100 100 500 500
                :fill-color "red"
                :clip-path "url(#foo)")



(svg+-rectangle svg 100 100 500 500 :gradient "gradient1")

(svg+-rectangle svg 100 100 500 500 :gradient "gradient" :id "rec1")
(svg+-circle svg 500 500 100 :id "circle1")
(svg+-ellipse svg 100 100 50 90 :stroke "red" :id "ellipse1")
(svg+-line svg 100 190 50 100 :id "line1" :stroke "yellow")
(svg+-polyline svg '((200 . 100) (500 . 450) (80 . 100))
	           :stroke "green" :id "poly1")
(svg+-polygon svg '((100 . 100) (200 . 150) (150 . 90))
	          :stroke "blue" :fill "red" :id "gon1")
(svg+-path svg '((moveto ((200 . 100) (100 . 200) (0 . 100))))
           :stroke "black" :fill "green")
(svg+-path svg '((moveto ((300 . 300)))
                 (horizontal-lineto (400) :relative nil)
                 (vertical-lineto (100)))
           :relative t :stroke "brown" :fill "white")
(svg+-path svg '((moveto ((600 . 200)))
                 (lineto ((50 . 0) (0 . 50) (-50 . 0) (0 . -50))))
           :relative t :stroke "blue" :fill "yellow")
(svg+-path svg '((moveto ((400 . 200)))
                 (curveto ((50 0 100 -50 100 100)
                           (0 0 -50 100 -100 100)) :relative t))
           :stroke "black" :fill "white" :fill-opacity "0.1")
(svg+-path svg '((moveto ((300 . 100)))
                 (smooth-curveto ((25 50 50 50)
                                  (25 -50 50 -50)
                                  (25 50 50 50)
                                  (25 -50 50 -50)) :relative t))
           :stroke "black" :fill-opacity "0")

                 ;; (curveto ((1 0 1 2 2 2) (2 1 3 0 4 0)))
                 ;; (smooth-curveto ((10 20 20 20) (30 0 40 0)))
                 ;; (elliptical-arc ((2 2 5 0 :large-arc t :sweep t)
                 ;;                  (3 4 0 7)) :relative nil)
                 ;; (closepath :relative nil)))

(with-temp-file "example.svg"
  (set-buffer-multibyte nil)
  (svg+-print svg))
 
