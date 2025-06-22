\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*3
    r2 r r4 d'^\solo
    d c h2 a
    r r4 c2 h4
  }
}

SopranoLyrics = \lyricmode {
  vi --
  ta, dul -- ce -- do
  et spes
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*3
    a'2^\solo a4 g f2
    e r4 e2 d4
    e h c8[ d] e4 d2
  }
}

AltoLyrics = \lyricmode {
  vi -- ta, dul -- ce --
  do et spes
  no -- stra, sal -- _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    e2^\solo a, r4 d
    c d h2 a
    r4 gis a h c8[ d] e4
    e4. d8 e2 r
    r r r4 a,~
    a gis a e8[ f] g2
  }
}

TenoreLyrics = \lyricmode {
  Sal -- ve, sal --
  ve Re -- gi -- na,
  ma -- ter mi -- se -- ri --
  cor -- di -- ae,
  et __
  spes no -- stra, "sal -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*4
    r4 a'^\solo a g f2
    e r r
  }
}

BassoLyrics = \lyricmode {
  vi -- ta, dul -- ce --
  do
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    a'2.-\solo g4 f2
    e r4 d c d
    h2 a4 gis' a g
    f2 e d
    a4 a'2 g4 f2
    e a4 e8 f g2
  }
}

BassFigures = \figuremode {
  r1 <7>4 <6>
  q2. q4 q <5>
  <7> <6\\>1 <6>4
  <7> <6> <8 4> <\t _!>2.
  <4>4 <3> <2> r <7> <6>
  <4> <_+>2 <6>4 <4> <3>
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
