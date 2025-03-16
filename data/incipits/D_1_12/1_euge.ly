\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    r4 h' d g a d,
    h' g a d d, a'
    h g a d d, g
    h g a, g' d, fis'
    g h g d h g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    r4 g' h d2 fis4
    d g fis a fis d~
    d g fis a g d~
    d h a g' d, fis'
    g d2 h g4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    h'2.^\tutti h4 d2
    h a r
    h a g
    h a1
    h r2
  }
}

SopranoLyrics = \lyricmode {
  E -- u -- ge
  ser -- ve
  bo -- ne et
  fi -- de --
  lis,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    g'2.^\tutti g4 a2
    g fis r
    g fis d
    g g fis
    g1 r2
  }
}

AltoLyrics = \lyricmode {
  E -- u -- ge
  ser -- ve
  bo -- ne et
  fi -- de -- _
  lis,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    d2.^\tutti d4 d2
    d d r
    d d d
    d d1
    d r2
  }
}

TenoreLyrics = \lyricmode {
  E -- u -- ge
  ser -- ve
  bo -- ne et
  fi -- de --
  lis,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    g'2.^\tutti g4 fis2
    g d r
    g d h
    g d'1
    g, r2
  }
}

BassoLyrics = \lyricmode {
  E -- u -- ge
  ser -- ve
  bo -- ne et
  fi -- de --
  lis,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    g'2.-\tutti g4 fis2
    g d r
    g d h
    g d'1
    g, r2
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r2 <4> <3>
  r1.
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
