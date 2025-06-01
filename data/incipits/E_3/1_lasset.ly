\version "2.24.2"
\include "header.ly"

ChalumeauI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Tempo passato"
    b'2~
    b~
    b8 g' \tuplet 3/2 8 { \sbOn f16 es d es d c \sbOff }
    d4 r8 d \gotoBar "18"
    R2*4
  }
}

ChalumeauII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Tempo passato"
    d'2~
    d
    b8 es \tuplet 3/2 8 { \sbOn d16 c b c b a \sbOff }
    b4 r8 b \gotoBar "18"
    R2*4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Tempo passato"
    b'4. \tuplet 3/2 8 { d16 c b }
    b4. \tuplet 3/2 8 { d16 c b }
    g( b) es( g) \tuplet 3/2 8 { \sbOn f es d es d c \sbOff }
    d( b) f'( d) b'8 r \gotoBar "18"
    d,8\p \tuplet 3/2 8 { f16 es d } d8 r
    b \tuplet 3/2 8 { d16 c b } b8 r
    g'8.\trill f32 es d8 c
    \tuplet 3/2 8 { d16 c b } b8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Tempo passato"
    f8 d16. f32 b,8 \tuplet 3/2 8 { f'16 es d }
    d8. es16 f8 b
    g es' \tuplet 3/2 8 { \sbOn d16 c b c b a \sbOff }
    b( f) d'( b) f'8 r \gotoBar "18"
    b,8\p \tuplet 3/2 8 { d16 c b } b8 r
    d, b16. d32 f8 r
    b16( g) c8 b a
    b16 f d f b,8 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 2/4 \tempoMarkup "Tempo passato" \autoBeamOff
    R2*4 \gotoBar "18"
    b'4.^\solo \tuplet 3/2 8 { d16[ c b] }
    b4. \tuplet 3/2 8 { d16[ c b] }
    g8[ es'] d[ c]
    \tuplet 3/2 8 { d16[ c b] } b8 f \tuplet 3/2 8 { b16[ c d] }
  }
}

SopranoLyrics = \lyricmode {
  La -- ßet
  al -- le
  Ke -- zer
  ſchwär -- men, die durch
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Tempo passato"
    b'8 b f f
    g g d d
    es es f f
    b, b' d, b \gotoBar "18"
    b8 b f' f
    g g d d
    es c f f,
    b b' d, b
  }
}

BassFigures = \figuremode {
  r4 <6 4>
  r <6>
  r <6 4>
  r2
  r4 <6 4>
  r <6>
  r <6 4>8 <5 3>
  r2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "chalumeau"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ChalumeauI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ChalumeauII
        }
      >>
    >>
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
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
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
