% lilypond --include=$EES_TOOLS_PATH --png -dresolution=300 -dno-point-and-click -dcrop file.ly

\version "2.24.2"

\include "ees.ly"
#(set-global-staff-size 11.22)
\paper {
  oddHeaderMarkup = ##f
  paper-width = 100\cm
}

part = #(define-scheme-function
  (parser location n)
  (string?)
  #{ \markup \remark { #n } #})

partSs = \part "S solo"
partAs = \part "A solo"
partTs = \part "T solo"
partBs = \part "B solo"
partSc = \part "S coro"
partSic = \part "S 1 coro"
partAc = \part "A coro"
partTc = \part "T coro"
partBc = \part "B coro"
partFl = \part "fl"
partClni = \part "clno 1, 2"
partTrbi = \part "trb 1"
partV = \part "vl"
partVi = \part "vl 1"
partVii = \part "vl 2"
partVla = \part "vla"
partVlcSolo = \part "vlc solo"
partUnk = \part "[unknown]"
partOrg = \part "org"

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

fC = \set Staff.forceClef = ##t
hA = \once \override Accidental.stencil = ##f
hy = \markup { \override #'(thickness . 1.25) \raise #.52 \draw-line #'(.5 . 0) }

aDue = \markup \remark "a 2"
aTre = \markup \remark "a 3"
aQuattro = \markup \remark "a 4"

skips = #(define-music-function
  (parser location n)
  (number?)
  #{ \repeat unfold #n { \skip 8 } #})
  
\layout {
  \context {
    \Staff
    \RemoveAllEmptyStaves
  }
}
