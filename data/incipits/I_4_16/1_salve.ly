\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Vivace"
    b'2. a4 b c
    a f a b g f
    b4. c8 d4 c d e
    f2 r r
    R1.
    r2 b, es!
    d4 c b b d e
    f c a f d'2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Vivace"
    b'2. a4 b c
    a f a b g f
    b4. c8 d4 c d e
    f2 r r
    R1.
    r2 b, es!
    d4 c b b d e
    f c a f d'2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    b'2. a4 b c
    a f a b g f
    b4. c8 d4 c d e
    f2 r r
    R1.
    r2 b, es!
    d4 c b b d e
    f c a f d'2
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _ ve Re --
  gi -- na, ma -- _ ter mi --
  se -- _ ri -- _ cor -- di --
  ae,

  vi -- ta,
  vi -- _ ta, dul -- ce -- do
  et spes no -- stra, "sal -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    R1.
    f2. d4 es f
    d b f'8[ g] a4 g2
    c,4 c f f g a
    b2 f b
    a4 g f f g a
    b f d b b'2
    a1 f2
  }
}

AltoLyrics = \lyricmode {
  Sal -- _ ve Re -- %2
  gi -- na, sal -- ve ma --
  ter mi -- se -- ri -- cor -- di --
  ae, vi -- ta,
  vi -- _ ta, dul -- ce -- do
  et spes no -- stra, spes
  no -- stra,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    R1.*2
    b2. a4 b c
    a f d'2 c
    r4 b d c d e
    f2 r r
    R1.*2
  }
}

TenoreLyrics = \lyricmode {
  Sal -- _ ve Re --
  gi -- na, ma -- ter
  mi -- se -- ri -- cor -- di --
  ae,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    R1.*3
    f2. d4 es f
    d b b' a g2
    f d c
    b r r
    r f' b
  }
}

BassoLyrics = \lyricmode {
  Sal -- _ ve Re --
  gi -- na, sal -- ve ma --
  ter, sal -- _
  ve,
  vi -- ta,
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "Vivace"
    b''2. a4 b c
    << { a f a b g a } \\ { f2. d4 es f } >>
    \clef tenor b,2. a4 b c
    \clef bass f,2. d4 es f
    d b b' a g2
    f4. es8 d2 c
    b1 \clef soprano << {
      d''4 e
      f c
    } \\ {
      b2 %7
      a
    } >> \clef bass f,2 b
  }
}

BassFigures = \figuremode {
  r1.
  r
  r2. <6>4 r <_!>
  <5>2 <6> <6 5>
  r1 <5>4 <6!>
  r2 <6> <5>4 <6>
  r1.
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
