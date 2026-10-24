\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 f, a16 a a h cis8. cis16 cis8 cis16 d
    e8. cis16 a8 g f4 r8 a
    c8. c16 f8 c d8. a16 a8 c
    h h16 h fis8 a g4 r8 g
  }
}

SoliLyrics = \lyricmode {
  Wäll I mei Krä -- mel ganz ver -- ſpilt, ſo iß
  Hol -- lä -- hip -- pen Brauch wälß
  oä -- nen wie den an -- dern gilt ſo
  laß I mi tau -- fen auch, hiez
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f2 e
    cis d4 f
    a,2 fis
    dis' e
  }
}

BassFigures = \figuremode {
  r2 <6\\>
  <6>1
  r
  r
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "Hollähippen-" "Krämer" }
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
