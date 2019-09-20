;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname word_processor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WORD-SIZE 20)
(define WORD-COLOR "dark green")
(define BACKGROUND (empty-scene 600 100 "yellow"))


; word-processor : String -> String
; Run a very simple word processor

(define (word-processor init-str)
  (big-bang init-str
    [to-draw draw-word] ; string -> image
    [on-key key-wp]))   ; string keyevent -> string


; draw-word : string -> image
; draws current text
(check-expect (draw-word "asdf")
              (overlay (text "asdf" WORD-SIZE WORD-COLOR)BACKGROUND))
(check-expect (draw-word "")
              (overlay (text "" WORD-SIZE WORD-COLOR)BACKGROUND))

(define (draw-word w)
  (overlay (text w WORD-SIZE WORD-COLOR)BACKGROUND))

; key-wp : String KeyEvent -> String
; add key pressed to the end of current string state

(check-expect (key-wp "ab" "j") "abj")
(check-expect (key-wp "" " ") " ")
(define (key-wp ws key)
  (if (and (string=? key "\b")(> (string-length ws) 0))
      (backspace ws) (string-append ws key)))

; backspace String->String
; removes last character of a string
(define (backspace ws)
  (substring ws 0 (sub1 (string-length ws))))

