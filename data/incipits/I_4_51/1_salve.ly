\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*3
    r2 r d'
    d g, r4 b
    d e f f, r c'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    a'1 d,2
    r4 f g a b2
    a r4 a g2
    f e f
    r g f4 f
    f g r a f g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*3
    r2 r d'~
    d g, r4 b
    d e f f, r c'
  }
}

SopranoLyrics = \lyricmode {
  Sal --
  ve, sal --
  ve Re -- gi -- na, "ma -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    a'1 d,2
    r4 f g a b2
    a r4 a g2
    f e f
    r g f4 f
    f g r a f g
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve,
  sal -- ve Re -- gi --
  na, Re -- gi --
  na, sal -- ve,
  sal -- ve Re --
  gi -- na, ma -- ter "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r d~
    d g, r4 b
    d e f2. e4~
    e d2 cis4 d2
    r4 a b c d2~
    d4 d c2 r
  }
}

TenoreLyrics = \lyricmode {
  Sal --
  ve, sal --
  ve Re -- gi -- na, __
  ma -- _ ter
  mi -- se -- ri -- cor --
  di -- ae,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*3
    a'1 d,2
    r4 f g a b2
    b2. a4 d, e
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve,
  sal -- ve, Re -- gi --
  na, ma -- ter "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    s1.*6
  }
}

BassFigures = \figuremode {
  %tacet
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
