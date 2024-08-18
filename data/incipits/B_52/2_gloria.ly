\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*3
    r8 \tuplet 3/2 8 { c'16 b c \sbOn f e f c b c \sbOff } a f' d f c f b, f'
    a, g f b a f' g, e' f16. f,32 f8 r4
    c'16( d) e( f) g( a) b( g) c( b) a( g) f( g) f( e)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*3
    r8 \tuplet 3/2 8 { c'16 b c \sbOn f e f c b c \sbOff } a f' d f c f b, f'
    a, g f b a f' g, e' f16. f,32 f8 r4
    c'16( d) e( f) g( a) b( g) c( b) a( g) f( g) f( e)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d2^\solo e
    f f4 a
    c a c b
    a r f^\tutti f
    f4. f8 f4 f
    g g f r
  }
}

SopranoLyrics = \lyricmode {
  Glo -- ri --
  a in ex --
  cel -- sis De -- _
  o. Et in
  ter -- ra pax ho --
  mi -- ni -- bus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d2^\solo e
    f f4 a
    c a c b
    a r f^\tutti f
    f4. f8 f4 f
    g g f r
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri --
  a in ex --
  cel -- sis De -- _
  o. Et in
  ter -- ra pax ho --
  mi -- ni -- bus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    f,2^\tutti f
    f4. f8 f4 f
    g g f r
  }
}

TenoreLyrics = \lyricmode {
  Et in %4
  ter -- ra pax ho --
  mi -- ni -- bus
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    f2^\tutti f
    f4. f8 f4 f
    g g f r
  }
}

BassoLyrics = \lyricmode {
  Et in
  ter -- ra pax ho --
  mi -- ni -- bus
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d8-\solo f e d c b a g
    f d'' c b a g f a
    e c f d a f' d e
    f-\tutti c a c f, b a g
    f d' c b a a' g f
    e d c b a f' a, f
  }
}

BassFigures = \figuremode {
  r1
  r1
  r2 <6>4 q
  r1
  r8 <6> <6> r <6>2
  r1
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
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
