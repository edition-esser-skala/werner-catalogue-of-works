\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 a c16 c c e e8 a, r e'
    cis8. cis16 cis d e f d8 r16 d d8 f
    c8. c16 g8 b a a r16 a a cis
    e8 cis a8. g16 f4 r8 d'
  }
}

SoliLyrics = \lyricmode {
  Äs iſt än al -- tes Sprich -- wort ſo
  I hab ghert bald da bald dort: was an den
  Gal -- gen ghert er -- trinckt nit und was er --
  ſauft daß henkt mär nit, "döſt -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    a2 a'
    g f
    e f
    cis d
  }
}

BassFigures = \figuremode {
  r1
  <2>2 <6>
  <6>1
  <6>
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
