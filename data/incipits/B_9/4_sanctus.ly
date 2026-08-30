\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "Andante"
    R1.*4
    e'2 e, e'~
    e4 dis h cis d2~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "Andante"
    R1.*3
    a'2 a, a'~
    a4 gis e fis gis ais
    h2. a4 fis gis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*4
    e'2^\tutti e, e'~
    e4 dis h cis d2~
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san --
  _ _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*3
    a'2^\tutti a, a'~
    a4 gis e fis gis ais
    h2. a4 fis gis
  }
}

AltoLyrics = \lyricmode {
  San -- ctus, san --
  _ _ _ _ _
  _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    e2^\tutti e, e'~
    e4 dis h cis d2~
    d4 cis a h cis dis
    e2 cis cis
    h1 h2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san --
  _ _ _ _
  _ _ _ _ _
  ctus, san -- ctus,
  san -- ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    a'2^\tutti a, a'~
    a4 gis e fis gis a
    h2. a4 fis gis
    a2 fis1
    e2 r r
    R1.
  }
}

BassoLyrics = \lyricmode {
  San -- ctus, san --
  _ _ _ _ _
  _ _ _ _
  ctus, san --
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \tempoMarkup "Andante"
    a'2-!-\tutti a,-! << {
      s
      e''1 e2~
      e4 dis h cis d?2
    } \\ {
      a2~^!
      a4 gis e fis gis a
      h2. a4 fis gis
    } >>
    a2 fis1
    e2 \clef tenor cis'1
    h1.
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  <5 4>4 <\t _+> <#(dotbf 5)>2. <6\\>4
  <4> <_+> <6>2 <5>4 <6\\>
  <8 5 4> <\t \t _+> <#(dotbf 5) _!>2. <6\\>4
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
