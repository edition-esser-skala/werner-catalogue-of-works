\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g'4 h8. c16
    d a fis d d'8. e32( fis)
    g16 d h g a fis d c
    c8 h d'8. e32( fis) \gotoBar "26"
    R2*3
    r4 d8. e32( fis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g'4 h8. c16
    d a fis d d'8. e32( fis)
    g16 d h g a fis d c
    c8 h d'8. e32( fis) \gotoBar "26"
    R2*3
    r4 d8. e32( fis)
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro" \autoBeamOff
    R2*4 \gotoBar "26"
    g4 h8.[ c16]
    d8 d4 c8
    h[ a16 h] c[ h] a[ g]
    \grace g fis8 g r4
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit,
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g'8^\solo g g g
    fis4 d8 c
    h4 c8 a'
    fis g d c \gotoBar "26"
    g' g g g
    fis fis fis fis
    g4 e8 c' c h d, c
  }
}

BassFigures = \figuremode {
  r2
  <6>
  q4 q
  <5>2
  r <6>4 <5>
  r <6>
  <4\+ 2>8 <6>4.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
