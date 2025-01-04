\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Job" r8 g b b b c
    d4 r8 d d d f es
    c c r g c c es c
    b r16 g g g b a f8 f r a
    d d f es c c r es %5
  }
}

SoliLyrics = \lyricmode {
  Ô mich be -- glückh -- ter
  Job! wie werd ich wohl be --
  zah -- len mein höch -- ſten Gott und
  Herr die ü -- ber -- häuff -- te Gna -- den? mit
  den Er mich vor al -- len pflegt %5
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2~ g
    f~ f
    es~ es
    cis d
    h! c
  }
}

BassFigures = \figuremode {
  r1
  <4! 2>
  <6>
  <7- 5>
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
