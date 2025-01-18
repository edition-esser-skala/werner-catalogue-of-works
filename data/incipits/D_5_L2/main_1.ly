\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 6/8 \autoBeamOff
    \once \omit Staff.TimeSignature
  d\breve*1/16 e d e f g\fermata \bar "||"
  \time 2/2 \clef treble << \context Voice = "incipit" {
    \voiceOne a'2. a4
    b2 g
    f e
    f  
  } \\ {
    f2. f4
    g2 e
    d cis
    d
  } >>
}

text = \lyricmode {
  A -- sper -- _ ges _ me.
  Do -- mi -- 
  ne hys -- 
  so -- _
  po
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
