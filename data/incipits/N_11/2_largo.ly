\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'2.
    g,4. c8 g( f)
    e4( g,) h
    c4. c'8 g( f)
    e4( g,) h %50
    c8 e'16( g) g8( fis) d16( g,) f'8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'2.
    e,4.\trill c16 d e8( d)
    c4( g) h
    c4. c16 d e8( d)
    c4( g) h %50
    c8 c'16( e) e8( d) h8.\trill a32 h
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'2.
    c4 c, r
    c8( d) e( g) f( d)
    e4(-. e-.) r
    c8( d) e( g) f( d)
    e4 r g
  }
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4(-. c-. c-.)
    c(-. c-.) r
    c4. e8 d( g,)
    c4(-. c-.) r
    c4. e8 d( g,)
    c4 r g'
  }
}

BassFigures = \figuremode {
  r2.
  r
  r2 <6>4
  r2.
  r2 q4
  r2.
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
