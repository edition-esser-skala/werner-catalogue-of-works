\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Andante"
    R1.*2
    r2 a'4 d2 h4~
    h e2 c d4
    h c2 \hA h4 c2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Andante"
    R1.*2
    r2 r4 a' f2
    d4 h' g2 e4 a
    g2. g4 g2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    a'4^\solo a2 c4 b a8[ g]
    a4 a8[ b] c[ d] e4 f2
    e a,4^\tutti d2 h4~
    h e2 c d4
    h c2 \hA h4 c2
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi --
  num, o -- _ mnes gen --
  tes, lau -- da -- te __
  no -- men, no --
  men Do -- mi -- ni.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    r4 c^\solo f a g f8[ e]
    f4 f8[ g] a4 g a h
    c2 r4 a^\tutti f2
    d4 h' g2 e4 a
    g2 g4. g8 g2
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi --
  num, o -- _ mnes gen -- _
  tes, lau -- da --
  te, lau -- da -- te, o --
  mnes po -- pu -- li.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*2
    g4^\tutti c2 a d4~
    d h2 e f4
    d e d4. d8 e4 c~^\solo
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te e --
  um, o -- mnes,
  o -- mnes po -- pu -- li. "Quo -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*2
    c2^\tutti f d
    g e a4 f
    g c, g4. g8 c2
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te
  e -- um, o -- mnes
  po -- _ _ pu -- li.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Andante"
    f,2-\solo f'4 a, b c
    f, f'2 e4 d2
    c-\tutti f d
    g e a4 f
    g c, g2 c
  }
}

BassFigures = \figuremode {
  r2. <6>4 q2
  r1 <5>4 <6!>
  r2 <5>4 <6> <5> <6!>
  <5 _!> <6 \t> <5!> <6>2 q4
  <_!>2 <4>4 <_!>2.
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
