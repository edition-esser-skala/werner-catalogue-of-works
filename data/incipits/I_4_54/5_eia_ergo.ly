\version "2.24.2"
\include "header.ly"

Chalumeau = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    R1*2 \gotoBar "18"
    g''4 r r2
    R1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    g''8 d g a16 b a8 b16 c \sbOn fis,( g) g16.\trill fis64( g) \sbOff
    a8 d, r d'16( c) c( b) b( a) a( g) g( f) \gotoBar "18"
    g,4 r r2
    r16 d' fis a d8 d, r2
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*2 \gotoBar "18"
    g'8^\solo d g a16([ b)] a8 b16([ c)] fis,8 g
    a16([ d,)] d8 r d'16 c c([ b)] b([ a)] a([ g]) g([ f)]
  }
}

AltoLyrics = \lyricmode {
  E -- ia, e -- ia er -- go, ad -- vo --
  ca -- ta, ad -- vo -- ca -- ta, ad -- "vo -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    g8 g'16 a b8 g c, c' d b
    fis d16 e fis8 d g a b h \gotoBar "18"
    g, g'16 a b8 g c, c' d b
    fis d16 e fis8 d g a b h
  }
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "chal"
      \Chalumeau
    }
    \new StaffGroup \with { \smallGroupDistance } <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "vl 1" "solo" }
        \ViolinoI
      }
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
  >>
}
