\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro"
    b'16 c d es f8 f,
    b16 b' a b b, b' a b \gotoBar "19"
    b,16\p c d es f8 f,
    b16 b' a b b,8 g'
    f16 es d8 es16 d c8
    d16 c b8~ b16 f d f
    b,8 d'4 e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro"
    b'16 c d es f8 f,
    b16 b' a b b, b' a b \gotoBar "19"
    b,16\p c d es f8 f,
    b16 b' a b b,8 g'
    f16 es d8 es16 d c8
    d16 c b8~ b16 f d f
    b,8 d'4 e8
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \twofourtime \key b \major \time 2/4 \autoBeamOff \tempoMarkup "Allegro"
    R2*2 \gotoBar "19"
    b'16[ c d es] f8 f,
    b4 r8 g'
    f16[ es d8] es16[ d c8]
    d16[ c b8] b4
    d4. e8
  }
}

SoliLyrics = \lyricmode {
  Wie __ _ der
  Hierſch zur
  Brun -- nen --
  quel -- le,
  al -- ſo
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro"
    b'4 a
    g d \gotoBar "19"
    b4\p a
    << { g'8 f16 es } \\ { g,4 } >> d'8 es
    f4 f,
    b d8 f
    b4 g
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  r
  r
  r4 <5>8 <6!>
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
        \set Staff.instrumentName = "Barmh."
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
