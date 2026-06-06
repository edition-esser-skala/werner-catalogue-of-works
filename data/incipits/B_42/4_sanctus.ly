\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    d'2. g4 fis e
    d2. e4 d c
    h2. c4 h a
    g2. g4 fis2
    h a1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    r2 g'1~
    g4 a h g2 r4
    d e8 fis g4 e2 r4
    e2. e4 d fis8 e
    d2. cis8 h \hA cis2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    d'2.^\tutti g4 fis e
    d2. e4 d c
    h2. c4 h a
    g2. g4 fis2
    h a1
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _
  _ _ _ _
  _ _ _ _
  _ ctus, san --
  ctus, "san -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r2 g'1~^\tutti
    g4 a h g2 r4
    d e8[ fis] g4 e2 r4
    e2. e4 d fis8[ e]
    d2. cis8[ h] \hA cis2
  }
}

AltoLyrics = \lyricmode {
  San --
  _ _ ctus,
  san -- _ _ ctus,
  san -- ctus, san -- _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r2 h2.^\tutti c4
    d c h c h a
    h a g a g fis
    g h a2 a
    h a1
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  _ _ _ _ _ _
  _ _ _ _ _ _
  _ _ ctus, san --
  ctus, "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r2 g'2.^\tutti c4
    h a g2. a4
    g fis e2. fis4
    e d cis2 d
    g a1
  }
}

BassoLyrics = \lyricmode {
  San -- _
  _ _ _ _
  _ _ _ _
  _ _ ctus, san --
  ctus, "san -"
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    d''2-!-\tutti \clef bass g,,2. c4
    h a g2. a4
    g fis e2. fis4
    e d cis2 d
    g, a1
  }
}

BassFigures = \figuremode {
  r2 <5>2. <10>4
  q <\t> <5 3> <6 4> <5 3> <6\\>
  r2 <5 3>4 <6 4> <5 3> <3>
  q <6> <6 5>1
  r2 <4> <_+>
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
