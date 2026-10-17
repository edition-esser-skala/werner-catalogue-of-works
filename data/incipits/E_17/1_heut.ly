\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Andante"
    c'8. d32 e f8 c
    d16( b) f'( d) b'8 d, \gotoBar "12"
    f,16 a' c, f a,4
    R2
    r16 c\p f( c) a'16. c,32 c8
    r8 e~ e16 f g8~
    g16 f f8 f,16 a c8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Andante"
    a'16 f a8~ a a
    b16( f) d'( b) d,8 b' \gotoBar "12"
    f16 f' a, c f,4
    R2
    r16 a\p f( a) c16. a32 a8
    r g~ g16 a b8~
    b16 a a8 f16( c) a'8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twofourtime \key f \major \time 2/4 \autoBeamOff \tempoMarkup "Andante"
    R2*2 \gotoBar "12"
    r4 r8 c'
    d16[ b] d8 f d
    c4 r8 c
    b16[ a] b8 g' b,
    b16[\trill a] a8 r c
  }
}

SopranoLyrics = \lyricmode {
  Heüt
  tratt der Ja -- cobs
  Stern ins
  ſchö -- ne Him -- mels --
  zei -- chen der
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Andante"
    f8\f f4 f8
    f f4 f8 \gotoBar "12"
    f,4 r8 f'\p
    f f4 f8
    f f4 f8
    c c4 c8
    f c a f
  }
}

BassFigures = \figuremode {
  r2
  <6 4>
  r2
  <6 4>
  <5 3>
  <7>
  r
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
        \set Staff.instrumentName = "Soprano"
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
