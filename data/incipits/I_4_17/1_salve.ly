\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella"
    g'1
    h2 d
    e d
    c1
    h2 c
    d c~
    c h
    a1
    h2 h
    cis d
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella"
    d1
    g~
    g4 a h2
    e,2. fis4
    g2 fis4 e
    d2 e
    fis g
    e d
    d d
    e fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    g'1
    h2 d
    e d
    c1
    h2 c
    d c
    c h
    a2. a4
    h2 h
    cis d
  }
}

SopranoLyrics = \lyricmode {
  Sal --
  ve Re --
  gi -- na,
  sal --
  ve ma --
  ter mi --
  se -- ri --
  cor -- di --
  ae, vi --
  ta, "dul -"
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    d1
    g~
    g4 a h2
    e,2. fis4
    g2 fis4 e
    d2 e
    fis g
    e d
    d d
    e fis
  }
}

AltoLyrics = \lyricmode {
  Re --
  gi --
  _ na,
  sal -- ve
  ma -- _ _
  ter mi --
  se -- ri --
  cor -- di --
  ae, vi --
  ta, "dul -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    h1
    h4 a g fis
    e fis g2
    a1
    g2 a
    h a
    a g
    g fis
    g h
    a a
  }
}

TenoreLyrics = \lyricmode {
  Re --
  gi -- _ na, _
  sal -- _ ve
  ma --
  ter, ma --
  ter mi --
  se -- ri --
  cor -- di --
  ae, vi --
  ta, "dul -"
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    g2 g'~
    g4 fis e d
    c2 h
    a4 h c d
    e2 d4 c
    h2 c
    d e
    c d
    g, g'~
    g fis4 fis
  }
}

BassoLyrics = \lyricmode {
  Re -- gi --
  _ na, _
  sal -- ve,
  sal -- _ _ _
  ve ma -- _
  ter mi --
  se -- ri --
  cor -- di --
  ae, vi --
  ta, "dul -"
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella"
    g2 g'~
    g4 fis e d
    c2 h
    a4 h c d
    e2 d4 c
    h2 c
    d e
    c d
    g, g'~
    g fis
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  <5>
  <6>2 q
  <7> <5>
  <6 5>1
  r2 <5 3>
  <4\+ 2> <6>
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
