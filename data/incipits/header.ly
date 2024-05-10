% lilypond --include=$EES_TOOLS_PATH --png -dresolution=300 -dno-point-and-click -dcrop file.ly

\version "2.24.2"

\include "ees.ly"
#(set-global-staff-size 11.22)
\paper { oddHeaderMarkup = ##f }

\layout{
  \context {
    \Staff
    \override Clef.full-size-change = ##t
  }
}

gotoBar = #(define-music-function
  (parser location num)
  (string?)
  #{
    \mark \markup \remark #num
    \bar "||"
    \once \override Score.BreakAlignment.break-align-orders =
      #(make-vector 3 '(span-bar
                        breathing-sign
                        staff-bar
                        clef
                        key-signature
                        time-signature))
  #})
