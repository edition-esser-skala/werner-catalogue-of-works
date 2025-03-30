\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "[no tempo]"
    r4 d'\p e
    r d e
    d8 c' h( g) a( fis)
    g fis16 e d8 c h4
    R2.
    r4 \tuplet 3/2 4 { d'8 cis d } d,4
    R2.
    r4 a'2~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "[no tempo]"
    r4 h'\p c
    r h c
    h8 e d( h) c( a)
    h16 e d c h8 a g4
    R2.
    r4 \tuplet 3/2 4 { d''8 cis d } d,4
    R2.
    r4 fis8( d) cis( e)
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    g'4^\solo d r
    g8[ d] d4 r
    d8 e16[ fis] g8[ h] \tuplet 3/2 4 { a8[ g fis] }
    g[ fis] g4 h
    a8[ h] a[ fis] \tuplet 3/2 4 { g[ fis e] }
    fis8.[ g16] a4 h
    a8[ h16 cis] d4 g,
    fis8[ e] d4 r
  }
}

AltoLyrics = \lyricmode {
  Al -- ma
  Ma -- ter,
  Re -- dem -- pto -- ris
  Ma -- ter, quae
  per -- vi -- a
  coe -- _ li
  por -- _ ta
  ma -- nes
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "[no tempo]"
    g'2 r4
    g2 r4
    g g, d'
    g,2 g'4
    fis d' e,
    d2 g4
    fis h, cis
    d2 e4
  }
}

BassFigures = \figuremode {
  r2.
  r
  <5 3>8 <6 4> <5 3>2
  r2.
  r2 <6\\>4
  r2.
  r4 <5> <6 5>
  r2 <6\\>4
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
