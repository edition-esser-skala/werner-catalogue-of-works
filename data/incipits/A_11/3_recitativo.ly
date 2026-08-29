\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Barmherzigkheit" r8 a' d d f d
    b4 r8 \hA b b g \hA b a
    f f r a a a a b
    c4 r8 c c c es d
    b4 r8 g cis cis d e
  }
}

SoliLyrics = \lyricmode {
  Nein nein ver -- za -- ge
  nicht, du würſt noch Gna -- de
  fün -- den, dan dei -- nes Vat -- ters
  Hertz hat all -- zu bitt -- ren
  Schmertz, daß du von ihm "ge -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d1
    cis
    d
    es
    cis
  }
}

BassFigures = \figuremode {
  r1
  <7->
  r
  <6 4 2\+>
  <7- 5>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
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
