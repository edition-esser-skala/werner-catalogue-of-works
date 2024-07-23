\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    c'4. h8 e4. c8
    d h a d h4 r8 c~
    c a d c16 d h8 c4 h8
    c e4 d16 c h4 c
    r8 d4 c16 h a8 h a4\trill
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    r4 g'4. e8 a8. a16
    fis8 g4 fis8 g d g4
    e f d8 e f4
    e r r8 g4 fis16 e
    d8 h'4 a16 g fis8 g g fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    c'4. h8 e4. c8
    d h a[ d] h4 r8 c~
    c a d[ c16 d] h8 c4 h8
    c e4 d16[ c] h4 c
    r8 d4 c16[ h] a8 h a4
  }
}

SopranoLyricsA = \lyricmode {
  Fa -- ctus ci -- bus
  vi -- a -- to -- rum, vi --
  a -- to -- _ _ _
  rum: ve -- re, ve -- re
  pa -- nis fi -- li -- "o -"
}

SopranoLyricsB = \lyricmode {
  Cum I -- sa -- ac
  im -- mo -- la -- tur, im --
  mo -- la -- _ _ _
  tur, a -- gnus, a -- gnus
  Pas -- chae de -- pu -- "ta -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 g'4. e8 a8. a16
    fis8 g g[ fis] g d g4
    e f d8 e f4
    e r r8 g4 fis16[ e]
    d8 h'4 a16[ g] fis8 g g[ fis]
  }
}

AltoLyricsA = \lyricmode {
  Fa -- ctus ci -- bus
  vi -- a -- to -- rum, vi -- a --
  to -- rum, vi -- a -- to --
  rum: ve -- re
  pa -- _ nis fi -- li -- "o -"
}

AltoLyricsB = \lyricmode {
  Cum I -- sa -- ac
  im -- mo -- la -- tur, im -- mo --
  la -- tur, im -- mo -- la --
  tur, a -- gnus
  Pas -- _ chae de -- pu -- "ta -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r4 d4. h8 e4
    c a8 a g4 d'
    g,8 c4 h16[ a] g4. a8
    h g r e'4 d8 d4
  }
}

TenoreLyricsA = \lyricmode {
  Fa -- ctus ci --
  bus vi -- a -- to -- _
  rum: ve -- re pa -- _
  _ nis fi -- li -- "o -"
}

TenoreLyricsB = \lyricmode {
  Cum I -- sa --
  ac im -- mo -- la -- _
  tur, a -- gnus Pas -- _
  _ chae de -- pu -- "ta -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r2 g'4. e8
    a4 f g8 e d4
    c r r8 e4 d16[ c]
    h4. c8 d g d4
  }
}

BassoLyricsA = \lyricmode {
  Fa -- ctus
  ci -- bus vi -- a -- to --
  rum: ve -- re
  pa -- nis fi -- li -- "o -"
}

BassoLyricsB = \lyricmode {
  Cum I --
  sa -- ac im -- mo -- la --
  tur, a -- gnus
  Pas -- chae de -- pu -- "ta -"
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    << {
      c''4. h8 e4. c8
      d[ h]
    } \\ {
      r4 g4. e8 a4
      fis8[ g]
    } >> \clef tenor d4 \clef bass g,4. e8
    a4 f g8 e d4
    c8 \clef tenor c'4 h16 a g8 \clef bass e4 d16 c
    h4. c8 d g d4
  }
}

BassFigures = \figuremode {
  r1
  r4 <4>8 <_+> <5>4 <6>4
  r <6>8 <5>4. <7>8 <6>
  r <10>4 q16 q q8 <5> <6>4
  q4. q8 <_+>4 <4>8 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
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
