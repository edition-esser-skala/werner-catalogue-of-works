\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r8 g'\p c( g) g( f)
    e4 r r
    r8 g c( e) c( g)
    e4 r r
    r g'16(\trill f) g8 c4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r8 g'\p e16 d e8~ e d
    c4 r r
    r8 e g( c) g( e)
    c4 r r
    r r e'16(\trill d) e8
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'4^\solo c f,
    e8([\trill d)] e4 r
    g8.[\trill a32 h] c8[ g] g[ f]
    e([\trill d)] e4 r
    e16[ f e d] c8[ d] e fis
    g[ fis] g4 r8 g
  }
}

AltoLyrics = \lyricmode {
  Al -- _ ma
  ma -- ter,
  ma -- _ ter
  al -- ma,
  Re -- dem -- pto -- ris
  Ma -- ter, quae
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    c8-\solo d e4 d
    c r r
    c e d
    c r r
    c2 a4
    g e' c
  }
}

BassFigures = \figuremode {
  r4 <6> q
  r2.
  r4 <6> q
  r2.
  r2 <5>8 <6\\>
  r4 <6>2
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
