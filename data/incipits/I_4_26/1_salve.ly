\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    g''2.~-\conSord
    g4 f8( e) d( c)
    c4( d) c8 d
    h4\trill c \tuplet 3/2 { d8 e f }
    e( g) f( e) d( c)
    a'4 \appoggiatura g8 f4 \appoggiatura e8 \afterGrace d4 c8(
    h)( c) d( g,) g( fis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    g''2.~-\conSord
    g4 f8( e) d( c)
    c4( d) c8 d
    h4\trill c \tuplet 3/2 { d8 e f }
    e( g) f( e) d( c)
    a'4 \appoggiatura g8 f4 \appoggiatura e8 \afterGrace d4 c8(
    h)( c) d( g,) g( fis)
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'2.~^\solo
    g4 f8[ e] d[ c]
    c4 d c8[ d]
    h4 c r
    \tuplet 3/2 { e8[ f g] } f[ e] d[ c]
    a'4 \appoggiatura g8 f4 \appoggiatura e8 d4
    h8[ c] d4 r
  }
}

AltoLyrics = \lyricmode {
  Sal --
  ve Re --
  gi -- _ na,
  sal -- ve
  Re -- gi -- na,
  sal -- _ ve
  ma -- ter
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4-\solo e h
    c d e
    f d f
    g8 f e4 h
    c d e
    f d f
    g2 a4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  r2 <6>4
  r2.
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
        \set Staff.instrumentName = "S"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
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
