\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Der mitleidige Vatter" r8 g e4 r16 e f g
    c,4 r8 e g g c g
    a a r a a a f a
    cis,4 r8 e g g g f
    d4 r8 a' a a a d
  }
}

SoliLyrics = \lyricmode {
  Mein Sohn! khom oh -- ne
  Scheu, wie ſehr hat mich ver --
  lan -- get nach dei -- ner Reu und
  Bueß, nun ich be -- khen -- nen
  mueß, weil du ſo ſchmertz -- lich
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c1
    e
    f
    e
    d
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <6\\>
  r
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
