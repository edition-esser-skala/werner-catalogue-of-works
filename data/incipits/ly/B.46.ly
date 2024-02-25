% lilypond --include=$EES_TOOLS_PATH -dno-point-and-click B.46.ly
% pdfcrop --margins "0 5 0 0" B.46.pdf B.46.pdf

\version "2.24.2"

\include "ees.ly"
#(set-global-staff-size 11.22)
\paper { oddHeaderMarkup = ##f }

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Allegretto o vivace"
  \override Score.BreakAlignment.break-align-orders =
    #(make-vector 3 '(span-bar
                      breathing-sign
                      staff-bar
                      clef
                      key-signature
                      time-signature))
  c'8.^\markup \remark "vl 1" c,16 c d32 e f g a h c8. c,16 c c' h( c) \bar "||"
  \set Score.currentBarNumber = #11 \autoBeamOff
    \override Staff.Clef.full-size-change = ##t
  \clef soprano c8.^\markup \remark "S coro" c16 d8 g e c r4
  c8. c16 d8 h c c r4 \mark \markup \remark "83"
}

text = \lyricmode {
  \repeat unfold 14 { \skip 8 }
  Ky -- ri -- e e -- lei -- son, 
  Ky -- ri -- e e -- lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}

