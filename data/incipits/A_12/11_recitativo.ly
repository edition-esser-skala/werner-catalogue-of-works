\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Jobs Frau" c' c16 c f c d8. a16 a8 a16 b
    c8 c es d b b r \hA b16 d
    c8 f, es' d b4 d8 \hA b
    g8. g16 a8 b b f r4
    r g16 h d es c8. c16 c8 \hA es16 c
  }
}

SoliLyrics = \lyricmode {
  Ey, ey, wie gar ein from -- men Mann ha -- be
  ich doch ü -- ber -- khom -- men, je -- zo
  ſe -- he ich den Lohn, wie das
  Glickh hat ab -- ge -- noh -- men.
  Kenn -- ſtu dei -- ne Ein -- fald nicht, wil -- ſtu
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f2 fis~
    fis g
    a b
    es, f4 f,
    h!2 c
  }
}

BassFigures = \figuremode {
  r2 <6>
  <7- 5> <_->
  <6>1
  r2 <4->4 <3>
  <6>2 <_->
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
