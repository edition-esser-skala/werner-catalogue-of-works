\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro"
    R1*3
    r2 g'4. g8
    d'4 b8 g es' es d c
    b d c b a d, d'4~
    d8 cis d2 e4
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro"
    R1
    r2 d4. d8
    g4 f8 d b' b a g
    f d fis a d,4 c8 es
    d4. b'8 g4. a8
    d, b' a g f!2
    e8 e a f d d cis e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro" \autoBeamOff
    R1*3
    r2 g'4. g8
    d'4 b8 g es' es d c
    b d c b a d, d'4~
    d8 cis d2 e4
  }
}

SopranoLyrics = \lyricmode {
  In -- tro -- %4
  i -- bo in do -- mum, do -- mum
  tu -- am, do -- mum tu -- am, do --
  mum tu -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro" \autoBeamOff
    R1
    r2 d4. d8
    g4 f8 d b' b a g
    f d fis a d,4 c8 es
    d4. b'8 g4. a8
    d, b' a g f!2
    e8 e a f d d cis e
  }
}

AltoLyrics = \lyricmode {
  In -- tro --
  i -- bo in do -- mum, do -- mum
  tu -- am, do -- mum tu -- am, in
  do -- mum tu -- _
  am, in do -- mum tu --
  am, in do -- mum, do -- mum tu -- am,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro" \autoBeamOff
    g4. g8 d'4 b8 g
    es' es d c b g r g
    b c d2 cis4
    d4. c8 b b a g
    fis4 g c8 c b a
    g4 c d a
    a r r2
  }
}

TenoreLyrics = \lyricmode {
  In -- tro -- i -- bo in
  do -- mum, do -- mum tu -- am, in
  do -- mum tu -- _
  am, in do -- mum, do -- mum
  tu -- am, do -- mum, do -- mum
  tu -- am, tu -- _
  am,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro" \autoBeamOff
    R1*5
    r2 d4. d8
    a'4 f8 d b' b a g
  }
}

BassoLyrics = \lyricmode {
  In -- tro --
  i -- bo in do -- mum, do -- mum
}

Organo = {
  \relative c {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Poco allegro"
    g'4.-! g8-! d'4-! b8-! g-!
    es'-! es-! d-! c-! << {
      d4. d8
      \clef alto g4 f8 d b' b a g
      f d fis a
    } \\ {
      b,8 g r g
      b c d4~
      d cis
      d4. c8
    } >> b b a g
    fis4 g c8 c b a
    g4 c \clef bass d,4. d8
    a'4 f8 d b' b a g
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r2 <6>
  <6> <10> 8 q q q
  r4 <6>8 <5> <_!>2
  <4>8 <_+> <6>2 <_+>8 <6>
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
