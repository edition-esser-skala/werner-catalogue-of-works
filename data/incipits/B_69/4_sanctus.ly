\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r2 g''~
    g4 f e r
    f e2 d4~
    d c h2\trill
    a4 r b2~
    b8 a a4 r g'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c'2 cis
    d2. c4
    b2 a
    gis4 a2 \hA gis4
    a a4. g8 d e
    f4 f' e4. e8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    c'2^\tutti cis
    d2. c4
    b2 a
    gis4 a2 \hA gis4
    a r b2~
    b8 a a4 a b8[ c]
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _ ctus,
  san -- ctus,
  san -- _ _
  ctus Do --
  mi -- nus De -- us,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 g'~^\tutti
    g4 f e r
    f e2 d4~
    d c h2
    a4 a'4. g8 d[ e]
    f2 r4 g
  }
}

AltoLyrics = \lyricmode {
  San --
  _ ctus,
  san -- _ _
  ctus, san --
  ctus Do -- _ mi --
  nus, "Do -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 r4 b~^\tutti
    b a gis a~
    a g2 f4
    e2 e
    e4 r r2
    r4 f' e4. e8
  }
}

TenoreLyrics = \lyricmode {
  San --
  _ ctus, san --
  _ _
  ctus, san --
  ctus
  Do -- mi --
  nus De -- _ us
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 e^\tutti
    d e4 f
    d e cis d
    e a e2
    a,4 r r2
    r4 d4. c8 g[ a]
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus, san -- ctus,
  san -- _ ctus, san --
  _ ctus, san --
  ctus
  Do -- _ "mi -"
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c''2-!-\tutti \clef bass e,,
    d e4 f
    d e cis d
    e a, e2
    a4 \clef soprano << {
      a'' b2~
      b8[ a]
    } \\ {
      a4. g8 d e
      f4
    } >> \clef bass d,4. c8 g a
  }
}

BassFigures = \figuremode {
  r2 <6\\ 5- 3>
  <8 6- 4>4 <\t 5 3> <7 _+> <5>
  <6- 5> <\t> <6 5>2
  <7 _+> <4>4 <_+>
  r1
  r4 <3> <2> <6 _->8 <\t 3>
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
