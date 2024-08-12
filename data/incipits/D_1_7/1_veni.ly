\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Presto"
    b'2\f f'4 f
    d b r8 es d c
    d4( c8.)\trill b16 b8 d c b
    c f, f'2 e4
    f8 c f f d f es d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Presto"
    r2 r8 a'\f b c
    f,4 r8 f' b, c b4~
    b a b r
    r8 c b a g4. g8
    c,4 r8 a' f d g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    b'2^\tutti f'4 f
    d b r8 es d c
    d4 c8.\trill b16 b8 d c b
    c f, f'2 e4
    f8 c f f d f es d
  }
}

SopranoLyrics = \lyricmode {
  Ve -- ni, cre --
  a -- tor, cre -- a -- tor
  Spi -- _ ri -- tus, men -- tes tu --
  o -- rum vi -- si --
  ta: Im -- ple su -- per -- na gra -- "ti -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1
    b2^\tutti g'8 es f g
    f4. f8 f4 r
    r8 f g a g g g8. g16
    c,4 r8 a' f d g g
  }
}

AltoLyrics = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus,
  men -- tes tu -- o -- rum vi -- si --
  ta: Im -- ple su -- per -- na
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    b4^\tutti c8 d c2
    f,4 r8 f' b,[ c] b4
    b a8. b16 b4 r
    r8 c b a b c16[ d] c8 c
    c4 r8 c d b b g
  }
}

TenoreLyrics = \lyricmode {
  Ve -- ni, cre -- a --
  tor, cre -- a -- tor
  Spi -- _ ri -- tus,
  men -- tes tu -- o -- rum vi -- si --
  ta: Im -- ple su -- per -- na
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r2 f^\tutti
    b4 b g f8[ es]
    f4. f8 b,4 r
    r8 a' g f g c, c' b
    a4 r8 f b b g b
  }
}

BassoLyrics = \lyricmode {
  Ve --
  ni, cre -- a -- tor
  Spi -- ri -- tus,
  men -- tes tu -- o -- rum vi -- si --
  ta: Im -- ple su -- per -- na
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Presto"
    b'8-\tutti d c b a f g a
    b a g f es c d es
    f es f f, b4 r
    r8 a' g f g c, c' b
    a4 r8 f b b g b
  }
}

BassFigures = \figuremode {
  r1
  r1
  <6 4>4 <5 3>2.
  r8 <6>4. <7>8 <4> <_!> r
  <6>2. <6->8 <3>
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
