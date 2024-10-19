% lilypond --include=$EES_TOOLS_PATH --png -dresolution=300 -dno-point-and-click -dcrop file.ly

\version "2.24.2"

\include "ees.ly"
#(set-global-staff-size 11.22)
\paper {
  oddHeaderMarkup = ##f
  paper-width = 100\cm
}

partSs = \markup \remark "S solo"
partAs = \markup \remark "A solo"
partTs = \markup \remark "T solo"
partBs = \markup \remark "B solo"
partSc = \markup \remark "S coro"
partSic = \markup \remark "S 1 coro"
partAc = \markup \remark "A coro"
partTc = \markup \remark "T coro"
partBc = \markup \remark "B coro"
partFl = \markup \remark "fl"
partClni = \markup \remark "clno 1, 2"
partTrbi = \markup \remark "trb 1"
partV = \markup \remark "vl"
partVi = \markup \remark "vl 1"
partVii = \markup \remark "vl 2"
partVla = \markup \remark "vla"
partVlcSolo = \markup \remark "vlc solo"
partUnk = \markup \remark "[unknown]"
partOrg = \markup \remark "org"

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

hA = \once \override Accidental.stencil = ##f
hy = \markup { \override #'(thickness . 1.25) \raise #.52 \draw-line #'(.5 . 0) }

skips = #(define-music-function
  (parser location n)
  (number?)
  #{ \repeat unfold #n { \skip 8 } #})
