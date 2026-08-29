\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    h'2. c4 d c8 d
    e4 d c1\trill
    h4 g8 a h4 d c h
    a2 r r
    R1.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    r2 g' g
    g2. a4 e fis
    g2 d r
    fis2. g4 a g8 a
    h4 a g1\trill
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    h'2.^\tutti c4 d c8[ d]
    e4 d c1\trill
    h4 g8[ a] h4 d c h
    a2 r r
    R1.
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _
  _ _ _
  ctus, san -- _ _ _ _
  ctus,

}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r2 g'^\tutti g
    g2. a4 e fis
    g2 d r
    fis2. g4 a g8[ a]
    h4 a g1
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- _ _ _
  _ ctus,
  san -- _ _ _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g2.^\tutti a4 h a8[ h]
    c4 h a1
    g2 g4 h a g
    fis d d'2 d
    d2. e4 h cis
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _ _
  _ _ _
  ctus, san -- _ _ _
  ctus, san -- ctus,
  san -- _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.*3
    d2.^\tutti e4 fis e8[ fis]
    g4 fis e1
  }
}

BassoLyrics = \lyricmode {
  San -- _ _ _
  _ _ \hy
}

Organo = {
  \relative c {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    g'2.-\tutti a4 h a8 h
    c4 h a1
    g2. h4 a g
    \clef bass d2. e4 fis e8 fis
    g4 fis e1
  }
}

BassFigures = \figuremode {
  <10>2. q4 q2
  r <7> <6\\>
  r2. <3>4 q q
  q2. q4 q2
  r <7> <6\\>
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
