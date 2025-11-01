\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    R2.*3
    c'2 d4
    h g r8 c
    d e f4. e16 d
    e8 d e f d e
    f[ f, g a] b! c16 d
    c4. b8 a g16 a
    b8 c d c d e
    f4 c r
    R2.
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f2 g4
    e c r8 f
    g a b4. a16 g
    a8 g f e f d
    g f e d e c
    f g a g a h
    c4. a8 b g
    a4 f d
    g e8 g f8. e16
    d4. e8 f g
    c,4 a'2
    d,4 g2~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*3
    c'2 d4
    h g r8 c
    d e f4. e16[ d]
    e8[ d e f d e]
    f[ f, g a] b![ c16 d]
    c4. b8 a[ g16 a]
    b8[ c d c d e]
    f4 c r
    R2.
  }
}

SopranoLyrics = \lyricmode {
  Sal -- ve,
  sal -- ve Re --
  gi -- na, sal -- _
  _
  _ _
  _ ve ma --
  _
  _ ter,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    f2 g4
    e c r8 f
    g a b4. a16[ g]
    a8[ g f e f d]
    g[ f e d e c]
    f[ g a g a h]
    c4. a8[ b g]
    a4 f d
    g e8 g f8. e16
    d4. e8 f[ g]
    c,4 a'2
    d,4 g2~
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve,
  sal -- ve Re --
  gi -- na, sal -- ve
  ma --
  _
  _
  _ _
  ter, sal -- ve
  ma -- ter mi -- se -- ri --
  cor -- _ di --
  ae, sal --
  ve, "sal -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*10
    c2 d4
    h g r8 c
  }
}

TenoreLyrics = \lyricmode {
  Sal -- ve,
  sal -- ve "Re -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*7
    f2 g4
    e c r8 f
    g a b4. a16[ g]
    a8[ g f e f d]
    g[ f e d e c]
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve,
  sal -- ve Re --
  gi -- na, "sal -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f4 d' b
    c4. b8 a4
    b8 a g4 c
    f, \clef soprano << {
      c''4 d
      h g r8 c
      d e f4. e16 d
      e8 d e f d e
    } \\ {
      f,8 e f d
      g f e d e c
      f g a g a h
      c4. a8 b g
    } >>
    \clef bass f,2 g4
    e c r8 f
    g a b4. a16 g
    a8 g f e f d
    g f e d e c
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2 q4
  <6 5> <7> q
  r2.
  r
  r
  r
  r
  r
  r4 <3> <4>
  <6>2 q4
  <_!> <6>2
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
