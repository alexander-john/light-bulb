;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname light-bulb) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ON "on")
(define OFF "off")

; A LightState is one of:
; - ON
; - OFF

; LightState -> Image
; translates the state s into a yellow circle representing on
; and a yellow circle outline representing off
(check-expect (light-render ON) (circle 30 "solid" "yellow"))
(check-expect (light-render OFF) (circle 30 "outline" "yellow"))
(define (light-render s)
  (cond
    [(string=? s ON) (circle 30 "solid" "yellow")]
    [(string=? s OFF) (circle 30 "outline" "yellow")]))

; LightState integer? integer? MouseEvent -> LightState
(check-expect (switch ON " ") OFF)
(check-expect (switch OFF " ") ON)
(define (switch s key)
  (cond
    [(and (string=? key " ") (string=? s ON)) OFF]
    [(and (string=? key " ") (string=? s OFF)) ON]))

; LightState -> LightState
; simulates a lightbulb
(define (light-bulb initial-state)
  (big-bang initial-state
    [to-draw light-render]
    [on-key switch]))