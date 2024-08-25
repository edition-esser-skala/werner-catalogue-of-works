\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Andante"
    r4 fis'32( g a g) fis8 fis32( g a g) fis8
    r4 d32( e fis e) d8 d32( e fis e) d8
    r h'( a fis) e g
    fis4 fis,32(\p g a g) fis8 fis32( g a g) fis8
    r h( a fis) e g
    fis4 a32(\f h cis h) a8 d4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Andante"
    r4 d'32( e fis e) d8 d32( e fis e) d8
    r4 fis,32( g a g) fis8 fis32( g a g) fis8
    r8 g'( fis d) cis e
    d4 d,32(\p e fis e) d8 d32( e fis e) d8
    r g( fis d) cis e
    d4 r fis32(\f e d e) fis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    a'4^\tutti a r
    d d r
    h a2
    a r4
    h\p a2
    a4 a\f d
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _
  ctus,
  san -- _
  ctus, san -- ctus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    fis4^\tutti fis r
    fis fis r
    g fis e
    fis2 r4
    g\p fis e
    fis r fis\f
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _ _
  ctus,
  san -- _ _
  ctus, "san -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    d4^\tutti d r
    d a r
    d2 cis4
    d2 r4
    d2\p cis4
    d r d\f
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _
  ctus,
  san -- _
  ctus, "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    d'4^\tutti d, r
    h' fis r
    g a2
    d, r4
    g\p a2
    d,4 r h\f
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _
  ctus,
  san -- _
  ctus, "san -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Andante"
    d'4-\tutti d, r
    h' fis r
    g a2
    d, r4
    g,4\p a2
    d4 r h\f
  }
}

BassFigures = \figuremode {
  r2.
  <5>4 <6>2
  r4 <4> <3>
  r2.
  r
  r2 <5>4
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
