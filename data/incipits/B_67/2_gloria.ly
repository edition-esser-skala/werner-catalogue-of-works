\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    R1
    d'4. d8 a4 a
    d,2 r
    a' h?4. cis8
    d4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    R1
    d'4. d8 a4 a
    d,2 r
    a' h?4. cis8
    d4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1
    d'4.^\tutti d8 a4 a
    d,2 r
    a' h4. cis8
    d4 r r2
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax
  ho -- mi -- ni --
  bus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r4 d4.^\tutti cis8 cis d16[ e]
    f2 e
    r4 a g g
    f e8 f g[ f16 e] d8 e
    f4 r r2
  }
}

AltoLyrics = \lyricmode {
  bo -- nae vo -- lun --
  ta -- tis,
  lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
  te,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    d4.^\tutti d8 a4 a
    d,2 r
    a' h4. cis8
    d4 r r2
    r4 c!8 c b!4 b8 b
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax
  ho -- mi -- ni --
  bus
  be -- ne -- di -- ci -- mus
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1
    r4 d4.^\tutti cis8 cis d16[ e]
    f2 e
    r4 a g g
    f e8 f g[ f16 e] d8 e
  }
}

BassoLyrics = \lyricmode {
  bo -- nae vo -- lun --
  ta -- tis,
  lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Organo = {
  \relative c {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    d'4.-! d8-! << { d cis cis d16 e <f f,>4 } \\ { a,2 d,4 } >>
    \clef bass d4. cis8 cis d16 e
    f2 e
    \clef tenor d'4 \clef bass a g g
    f e8 f g f16 e d8 e
  }
}

BassFigures = \figuremode {
  r1
  r4 <3> <5 2>2
  <6>2 <5>4. <6\\>8
  r4 <_!> q <4\+>
  <6> <6> r <6>
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
        \set Staff.instrumentName = "b"
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
