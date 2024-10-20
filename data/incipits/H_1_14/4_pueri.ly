\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 r8 b' d e
    f8. e16 d8 c b4.\trill b8
    a a4 h8 c4 r
    f,8 f'4 f8 e e16 d e8 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    r2 d
    f4. e8 d8. e16 f8 g
    a4 f d8. e16 f8 g
    c,4 r c8 c'4 c8
    a a16 g a8 f g4. e8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    r2 r8 b'^\tutti d e
    f8.[ e16] d8[ c] b4.\trill b8
    a a4 h8 c4 r
    f,8 f'4 f8 e e16 d e8 c
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te %2
  no -- men Do -- mi --
  ni, Do -- mi -- ni.
  Sit no -- men Do -- mi -- ni be -- "ne -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 d^\tutti
    f4. e8 d8.[ e16] f8[ g]
    a4 f d8.[ e16] f8[ g]
    c,4 r c8 c'4 c8
    a a16 g a8 f g4. e8
  }
}

AltoLyrics = \lyricmode {
  Lau --
  da -- te Do -- mi --
  num, lau -- da -- _
  te. Sit no -- men
  Do -- mi -- ni be -- ne -- di -- \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    r8 d,^\tutti f a b8 d4 c16[ b]
    c4 r r2
    f,8 f'4 f8 e e16 d e8 c
    d2 c
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te Do -- _ mi --
  num.
  Sit no -- men Do -- mi -- ni be -- ne --
  di -- ctum,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d2^\tutti f4. e8
    d4 d8 c b4. b8
    a a' b a g[ f16 e] d8[ e]
    f4 d8. d16 c4 r
    r2 c8 c'4 c8
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te
  pu -- e -- ri Do -- mi --
  num, lau -- da -- te pu -- e --
  ri Do -- mi -- num.
  Sit no -- men
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    d2 f4. e8
    d4. c8 b2
    a8 a' b a g f16 e d8 e
    f4 d c \clef tenor << { c''4 } \\ { e,8 c } >>
    d2 \clef bass c,8 c'4 c8
  }
}

BassFigures = \figuremode {
  <1>2 <6>
  <10> <5>4. <6>8
  q4. r4 <\t>8 <6>4
  r <5>8 <6!> r2
  <5 3>1
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
