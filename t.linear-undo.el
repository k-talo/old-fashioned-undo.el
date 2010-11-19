

;; Test `linear-undo/lst/split'.
;;
(let ((lst nil))
  (etm/eq (linear-undo/lst/get-next lst :chunk-p nil)
          nil
          "linear-undo/lst/get-next: 1"))

(let ((lst nil))
  (etm/eq (linear-undo/lst/get-next lst :chunk-p t)
          nil
          "linear-undo/lst/get-next: 2"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d"))))
  (etm/equal (linear-undo/lst/get-next lst :chunk-p nil)
             '(("b") ("c") nil ("d"))
             "linear-undo/lst/get-next: 3"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d"))))
  (etm/equal (linear-undo/lst/get-next lst :chunk-p t)
             '(nil ("d"))
             "linear-undo/lst/get-next: 4"))


;; Test `linear-undo/lst/split'.
;;
(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 0)
             0
             "linear-undo/lst/split: 0")
  (etm/equal lst
             '(nil ("a") ("b") ("c") nil ("d") ("e"))
             "linear-undo/lst/split: 0"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 1)
             1
             "linear-undo/lst/split: 1")
  (etm/equal lst
             '(nil ("a") nil ("b") ("c") nil ("d") ("e"))
             "linear-undo/lst/split: 1"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 2)
             2
             "linear-undo/lst/split: 2")
  (etm/equal lst
             '(nil ("a") nil ("b") nil ("c") nil ("d") ("e"))
             "linear-undo/lst/split: 2"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 3)
             2
             "linear-undo/lst/split: 3")
  (etm/equal lst
             '(nil ("a") nil ("b") nil ("c") nil ("d") ("e"))
             "linear-undo/lst/split: 3"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 3)
             2
             "linear-undo/lst/split: 3")
  (etm/equal lst
             '(nil ("a") nil ("b") nil ("c") nil ("d") ("e"))
             "linear-undo/lst/split: 3"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 4)
             3
             "linear-undo/lst/split: 4")
  (etm/equal lst
             '(nil ("a") nil ("b") nil ("c") nil ("d") nil ("e"))
             "linear-undo/lst/split: 4"))

(let ((lst '(nil ("a") ("b") ("c") nil ("d") ("e"))))
  (etm/=     (linear-undo/lst/split lst :limit 5)
             3
             "linear-undo/lst/split: 5")
  (etm/equal lst
             '(nil ("a") nil ("b") nil ("c") nil ("d") nil ("e"))
             "linear-undo/lst/split: 5"))

;; t.lenear-undo.el ends here
