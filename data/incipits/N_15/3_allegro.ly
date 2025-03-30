\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    g'8\f g' g
    g fis e
    d4 e16( cis)
    d4.
    d,8 c'! c
    c h a
    g4 a16( fis)
    g8. d16 e fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    g'8\f g' g
    g fis e
    d4 e16( cis)
    d4.
    d,8 c'! c
    c h a
    g4 a16( fis)
    g8. d16 e fis
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    g8\f g' g
    g fis e
    d4 e16( cis)
    d4.
    d,8 c'! c
    c h a
    g4 a16( fis)
    g4 a8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    g8\f g' g
    g fis e
    d4 e16( cis)
    d8 d' d
    d, c'! c
    c h a
    g4 a16( fis)
    g8 h, d
  }
}

BassFigures = \figuremode {
  r4.
  r
  r
  r
  r
  r
  r
  r8 <6> <_+>
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
