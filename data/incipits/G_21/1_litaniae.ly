\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4-\tutti e4. e8
    cis4 d2
    h4 cis e
    a, h d
    g, r r
    g a2
    g4 c2
    h a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'-\tutti a~
    a8 a fis4 h
    g e a~
    a d, g~
    g e a
    d, r d
    e2 d4~
    d e8 dis e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4^\tutti e4. e8
    cis4 d2
    h4 cis e
    a, h d
    g, r r
    g a2
    g4 c2
    h a4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- _ ri --
  e e --
  lei -- _ _
  son, Chri -- _
  ste,
  Chri -- ste
  e -- lei --
  _ son,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'^\tutti a~
    a8 a fis4 h
    g e a~
    a d, g
    g e a
    d, r d
    e2 d4~
    d e8[ dis] e4
  }
}

AltoLyrics = \lyricmode {
  Ky -- _
  ri -- e e --
  lei -- _ son, __
  Chri -- ste
  e -- lei -- _
  son, Chri --
  ste e --
  "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r4 r d^\tutti
    e4. e8 cis4
    d2 h4
    c!8[ d c h] a4
    h c d~
    d c8[ h] a4
    g2 c4
  }
}

TenoreLyrics = \lyricmode {
  Ky --
  _ ri -- e
  e -- _
  lei -- son,
  e -- lei -- _
  _ son,
  Chri \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    g'4^\tutti a4. a8
    fis4 g2
    e fis4
    g2 fis4
    e a fis
    g c,2
  }
}

BassoLyrics = \lyricmode {
  Ky -- _ ri --
  e e --
  lei -- son,
  Chri -- _
  ste, Chri -- ste
  e -- "lei -"
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 3/4 \tempoMarkup "Allegretto"
      \once \override Staff.TimeSignature.style = #'single-digit
    << {
      d''4 e4. e8
      cis4 d2
    } \\ {
      r4-\tutti g, a~
      a8 a fis4 <h d,>
    } >>
    \clef bass g, a4. a8
    fis4 g2
    e fis4
    g2 fis4
    e a fis
    g c,2
  }
}

BassFigures = \figuremode {
  r2.
  r
  <6>4 <_+>2
  <6>2.
  q
  <3>4 <2> <6>
  <7>2.
  r4 <7> <6>
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
