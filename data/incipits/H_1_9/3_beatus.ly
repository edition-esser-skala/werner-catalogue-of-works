\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto moderato"
    c'2 d4 h
    c8 b a g f e d4
    c r r2
    c' d4 h
    c a b g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto moderato"
    r4 f2 g4
    e f r2
    c d4 h
    c2 r
    r4 f g e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Presto moderato" \autoBeamOff
    c'2^\tutti d4 h
    c8[ b] a[ g] f[ e] d4
    c r r2
    c' d4 h
    c a b g
  }
}

SopranoLyrics = \lyricmode {
  Be -- a -- tus
  vir, be -- a -- tus
  vir,
  be -- a -- tus
  vir, be -- a -- tus
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Presto moderato" \autoBeamOff
    r4 f2^\tutti g4
    e f r2
    c d4 h
    c2 r
    r4 f g e
  }
}

AltoLyrics = \lyricmode {
  Be -- a --
  tus vir,
  be -- a -- tus
  vir,
  be -- a -- tus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Presto moderato" \autoBeamOff
    R1
    c2^\tutti d4 h
    c a a d
    g, a d4. d8
    g,4 c d c
  }
}

TenoreLyrics = \lyricmode {
  Be -- a -- tus
  vir, be -- a -- tus
  vir, be -- a -- tus
  vir, be -- a -- tus
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Presto moderato" \autoBeamOff
    R1
    r4 f2^\tutti g4
    e f d4. d8
    c4 f2 g4
    e f b,! c
  }
}

BassoLyrics = \lyricmode {
  Be -- a --
  tus, be -- a -- tus
  vir, be -- a --
  tus, be -- a -- tus
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Presto moderato"
    << {
      c''2 d4 h
      c
    } \\ {
      r4 f,2 g4
      c,
    } \\ {
      s1
      e4
    } >> \clef bass f,2 g4
    e f d2
    c8 b! a g f4 g
    << { e' } \\ { e, } >> f' b,! c
  }
}

BassFigures = \figuremode {
  r1
  r4 <5> <6> <_!>
  <6>2 <5>4 <6!>
  r2 <6>4 <_!>
  <6>2 q
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
