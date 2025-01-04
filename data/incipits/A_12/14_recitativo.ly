\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 f, b16 b c d es8 es r c
    a c es d b4 r8 f
    b b d \hA b g g16 g c8 g
    a cis e! g, f4 r8 d'
    b g cis8. d16 d8 a r4
    R1 \bar "|."
  }
}

SoliLyrics = \lyricmode {
  Ey la -- ßet mich dan ra -- ſten auf
  di -- ſen Kran -- khen -- beth, ihr
  pflegt nur an -- zu -- ta -- ſten mein Gmüth und
  Hertz ſo vol -- ler Schmertz, gleich
  de -- nen erz -- ver -- haß -- ten.
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b2 a~
    a b
    d e!
    cis d4 fis
    g2 a4 a,
    d2 r \bar "|."
  }
}

BassFigures = \figuremode {
  r2 <5->
  r1
  <6->2 <6>
  q2. q4
  <_->2 <4>4 <_+>
  r1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Job"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
