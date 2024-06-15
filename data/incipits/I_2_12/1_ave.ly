\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/8 \tempoMarkup "Ariose"
    r8 h'16( e,) c'( e,)
    r8 h'16( e,) c'( e,)
    h'8~ \tuplet 3/2 8 { h16 a g a[ g fis] }
    g fis e8 r
    d!16( e) fis( g) \tuplet 3/2 8 { a[ h c]
    h[ a g] } g8 h~
    h a16 h \tuplet 3/2 8 { c[ h a] }
    h( a) h8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/8 \tempoMarkup "Ariose"
    r8 g' a
    r g a
    \sbOn g16 fis \tuplet 3/2 8 { g fis e fis[ e dis] } \sbOff
    e( fis) g8 r
    d!16( e) fis( g) \tuplet 3/2 8 { a[ h c]
    h[ a g] } g8 g~
    g fis16 g \tuplet 3/2 8 { a[ g fis] }
    g( fis) g8 r
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/8 \tempoMarkup "Ariose" \autoBeamOff
    e4.~^\solo
    e~\trill
    e16[ fis] \tuplet 3/2 8 { g[ fis e] fis[ e dis] }
    e[ dis] e8 g~
    g fis16[ e] d[ c]
    h[ c] d8 g~
    g fis16[ g] \tuplet 3/2 8 { a[ g fis] }
    g[ fis] g8 d
  }
}

AltoLyrics = \lyricmode {
  A --

  ve Re --
  gi -- na, a --
  ve Re --
  gi -- na, a --
  ve coe --
  lo -- rum, "a -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/8 \tempoMarkup "Ariose"
    e4 r8
    e4 r8
    e, e' h
    e,4 h'16 c
    d!4 fis8
    g h g
    d4 d,8
    g4 h8
  }
}

BassFigures = \figuremode {
  r4.
  r
  r4 <_+>8
  r4 <6>8
  <4> <3> <6>
  r4.
  <6 4>8 <5 3>4
  r <6>8
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
        \set Staff.instrumentName = "A"
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
